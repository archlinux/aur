#!/usr/bin/env python3

import os
import json
import subprocess
import time
import sys
import signal
import configparser
import commentjson
from PyQt6.QtGui import QFont, QPixmap, QIcon, QCursor
from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QLabel,
    QScrollArea,QCheckBox,QPushButton
)
from PyQt6.QtCore import (
    Qt, QTimer, QPropertyAnimation, QEasingCurve
)
from PyQt6.QtWidgets import QGraphicsOpacityEffect
from PyQt6.QtWidgets import QLineEdit, QGridLayout
VERSION = "1.1.1"

config = configparser.ConfigParser()
user_config_path = os.path.expanduser("~/.config/hyprhide/config.cfg")
default_config_path = "/usr/share/hyprhide/config.cfg"

if os.path.exists(user_config_path):
    config.read(user_config_path)
elif os.path.exists(default_config_path):
    config.read(default_config_path)
elif os.path.exists("config.cfg"):
    config.read("config.cfg")
else:
    print("Please create a config.cfg file, or install this properly ")

JUMP_TO_MOUSE = config.get('GUI', 'JUMP_TO_MOUSE', fallback=False)
X_OFFEST = config.get('GUI', 'X_OFFEST', fallback=-240)
Y_OFFSET = config.get('GUI', 'Y_OFFSET', fallback=160)


HIDE_DIR = os.path.expanduser("~/.local/share/hypr-hide")
        


def get_hyprctl_clients():
    try:
        # Run hyprctl clients -j and capture output
        result = subprocess.run(['hyprctl', 'clients', '-j'], capture_output=True, text=True, check=True)
        
        # Parse the output as JSON
        clients = json.loads(result.stdout)
        
        return clients
    except subprocess.CalledProcessError as e:
        print(f"Error running hyprctl: {e}")
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
    
    return []

def get_client_by_address(address):
    try:
        # Run hyprctl clients -j
        result = subprocess.run(['hyprctl', 'clients', '-j'], capture_output=True, text=True, check=True)
        clients = json.loads(result.stdout)

        # Search for the client with the given address
        for client in clients:
            if client.get("address") == address:
                return client

        print(f"No client found with address: {address}")
    except subprocess.CalledProcessError as e:
        print(f"Error running hyprctl: {e}")
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")

    return None
class HiddenWindowItem(QWidget):
    def __init__(self, address, title, app_class, x, y, workspace,was_floating):
        super().__init__()
        self.address = address
        self.x = x
        self.y = y
        self.workspace = workspace
        self.was_floating = was_floating
        self.title = title
        self.app_class = app_class

        # Sleek card background with subtle border and hover effect
        self.setStyleSheet("""
            QWidget {
                background-color: #1e1e1e;
                border: 1px solid #3a3a3a;
                border-radius: 8px;
                padding: 8px;
            }
            QWidget:hover {
                border-color: #666666;
                background-color: #2a2a2a;
            }
            QLabel#name_label {
                color: #eeeeee;
                font-weight: bold;
                font-size: 11pt;
            }
            QLabel#title_label {
                color: #bbbbbb;
                font-size: 9pt;
            }
        """)
        self.setWindowOpacity(0.95)
        self.setCursor(Qt.CursorShape.PointingHandCursor)

        layout = QVBoxLayout()
        layout.setSpacing(6)
        layout.setContentsMargins(6, 6, 6, 6)

        # Name label (app class)
        name_label = QLabel(app_class)
        name_label.setObjectName("name_label")
        name_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        # layout.addWidget(name_label)

        # Title label (window title)
        title_label = QLabel(title)
        title_label.setObjectName("title_label")
        title_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        # layout.addWidget(title_label)

        # Screenshot thumbnail centered
        img_path = os.path.join(HIDE_DIR, f"{address}.png")
        if os.path.exists(img_path):
            pixmap = QPixmap(img_path).scaled(140, 105, Qt.AspectRatioMode.KeepAspectRatio, Qt.TransformationMode.SmoothTransformation)
            img_label = QLabel()
            img_label.setPixmap(pixmap)
            img_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        else:
            img_label = QLabel(title)
            img_label.setObjectName("title_label")
            img_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
            # layout.addWidget(title_label)
            # img_label = QLabel("[No Image]")
            # img_label.setFixedSize(140, 105)
            # img_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
            img_label.setStyleSheet("color: #555555; font-style: italic;")

        layout.addWidget(img_label)

        self.setLayout(layout)

        # Opacity effect for fade-in animation
        self.opacity_effect = QGraphicsOpacityEffect(self)
        self.setGraphicsEffect(self.opacity_effect)
        self.opacity_anim = QPropertyAnimation(self.opacity_effect, b"opacity")
        self.opacity_anim.setDuration(400)
        self.opacity_anim.setStartValue(0.0)
        self.opacity_anim.setEndValue(1.0)
        self.opacity_anim.setEasingCurve(QEasingCurve.Type.InOutQuad)
        self.opacity_anim.start()

    def mousePressEvent(self, event):
        if event.button() == Qt.MouseButton.LeftButton:
            self.on_restore_clicked()
            self.exit()
    def run_cmd(self, cmd):
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        return result.stdout.strip(), result.stderr.strip(), result.returncode

    def get_focused_window(self):
        out, _, _ = self.run_cmd("hyprctl activewindow -j")
        try:
            j = json.loads(out)
            return j.get("address", "")
        except Exception:
            return ""

    def cycle_until_focused(self, target_addr, max_tries=10):
        tries = 0
        while tries < max_tries:
            focused = self.get_focused_window()
            if focused == target_addr:
                return True
            self.run_cmd("hyprctl dispatch cyclenext")
            time.sleep(0.2)
            tries += 1
        return False

    def on_restore_clicked(self):
        addr = self.address
        if addr.startswith("0x"):
            addr = addr[2:]

        print(f"Restoring window {self.title} at {self.x},{self.y} on workspace {self.workspace}")

        self.run_cmd(f"hyprctl dispatch workspace {self.workspace}")
        time.sleep(0.3)

        self.run_cmd(f"hyprctl dispatch focuswindow address:0x{addr}")
        time.sleep(0.3)

        focused = self.get_focused_window()
        if focused != self.address:
            print("Direct focus failed, cycling to locate window...")
            max_tries = len(self.get_hyprctl_clients())
            success = self.cycle_until_focused(self.address,max_tries=max_tries)
            if not success:
                print("Failed to focus window after cycling")
                return
        client_data = get_client_by_address(self.address)
        if(client_data['floating'] == False):
            self.run_cmd("hyprctl dispatch togglefloating")
        self.run_cmd(f"hyprctl dispatch movetoworkspacesilent {self.workspace}")
        focused = self.get_focused_window()
        if focused != self.address:
            max_tries = len(self.get_hyprctl_clients())
            success = self.cycle_until_focused(self.address,max_tries=max_tries)
            if not success:
                print("Failed to focus window after cycling")
                return
        self.run_cmd(f"hyprctl dispatch moveactive {self.x} {self.y}")
        self.run_cmd("hyprctl dispatch togglefloating")
        if(self.was_floating == client_data['floating']):
            pass
        else:
            self.run_cmd("hyprctl dispatch togglefloating")
            # while(self.x !=client_data['at'][0] and self.y != client_data['at'][0]):
            print(f"Window disired pos: {self.x}:{self.y} vs {client_data['at'][0]}:{client_data['at'][1]}")
            self.run_cmd(f"hyprctl dispatch movetoworkspacesilent {self.workspace}")
            success = self.cycle_until_focused(self.address)
            if(success):
                self.run_cmd(f"hyprctl dispatch moveactive {self.x} {self.y}")
                # client_data = get_client_by_address(self.address)
        json_path = os.path.join(HIDE_DIR, f"{self.address}.json")
        try:
            os.remove(json_path)
        except Exception as e:
            print(f"Failed to remove {json_path}: {e}")

        img_path = os.path.join(HIDE_DIR, f"{self.address}.png")
        try:
            if os.path.exists(img_path):
                os.remove(img_path)
        except Exception as e:
            print(f"Failed to remove screenshot {img_path}: {e}")

        print("Restore complete.")


class HyprHideApp(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle(f"HyprHide {VERSION}")
        self.setFixedSize(460, 500)
        self.setWindowFlag(Qt.WindowType.WindowStaysOnTopHint, True)
        self.setWindowFlag(Qt.WindowType.Tool)

        self.layout = QVBoxLayout()
        self.layout.setContentsMargins(10, 10, 10, 10)
        self.layout.setSpacing(10)
        self.setLayout(self.layout)

        # 🔍 Search bar
        self.search_bar = QLineEdit()
        self.search_bar.setPlaceholderText("Search hidden windows...")
        self.search_bar.textChanged.connect(self.filter_items)
        self.layout.addWidget(self.search_bar)

        self.scroll_area = QScrollArea()
        self.scroll_area.setWidgetResizable(True)
        self.layout.addWidget(self.scroll_area)

        self.content_widget = QWidget()
        self.grid_layout = QGridLayout()
        self.grid_layout.setSpacing(10)
        self.grid_layout.setContentsMargins(8, 8, 8, 8)
        self.content_widget.setLayout(self.grid_layout)

        self.scroll_area.setWidget(self.content_widget)

        self.window_items = []
        self.load_hidden_windows()

        QTimer.singleShot(10, self.position_near_mouse)

    def load_hidden_windows(self):
        self.window_items.clear()
        for i in reversed(range(self.grid_layout.count())):
            self.grid_layout.itemAt(i).widget().setParent(None)

        if not os.path.exists(HIDE_DIR):
            os.makedirs(HIDE_DIR)

        files = [f for f in os.listdir(HIDE_DIR) if f.endswith(".json")]

        if not files:
            label = QLabel("No hidden windows")
            label.setAlignment(Qt.AlignmentFlag.AlignLeft)
            self.grid_layout.addWidget(label, 0, 0)
        else:
            row, col = 0, 0
            for file in files:
                try:
                    with open(os.path.join(HIDE_DIR, file)) as f:
                        data = json.load(f)
                        item = HiddenWindowItem(
                            address=data['address'],
                            title=data['title'],
                            app_class=data['class'],
                            x=data['at'][0],
                            y=data['at'][1],
                            workspace=data['workspace']['id'],
                            was_floating=data['floating']
                        )
                        self.window_items.append(item)
                        self.grid_layout.addWidget(item, row, col)
                        col += 1
                        if col >= 3:
                            row += 1
                            col = 0
                except Exception as e:
                    print(f"Error loading {file}: {e}")

    def filter_items(self, text):
        text = text.lower()
        for i in range(self.grid_layout.count()):
            item = self.grid_layout.itemAt(i).widget()
            visible = text in item.title.lower() or text in item.app_class.lower()
            item.setVisible(visible)

    def closeEvent(self, event):
        QApplication.quit()

    def position_near_mouse(self):
        if not self.isVisible():
            QTimer.singleShot(10, self.position_near_mouse)
            return

        pos = QCursor.pos()
        screen = QApplication.primaryScreen().availableGeometry()
        win_width = self.frameGeometry().width()
        win_height = self.frameGeometry().height()

        x = min(pos.x(), screen.width() - win_width)
        y = min(pos.y() + 20, screen.height() - win_height)
        print(f"Moving mouse to {x},{y}")
        if JUMP_TO_MOUSE == True:
            if(pos.x()+X_OFFEST > win_width or pos.x()+X_OFFEST < 0):
                # break
                pass
            elif(pos.y()+Y_OFFEST > win_height or pos.y()+Y_OFFEST < 0):
                # break
                pass
        # self.run_cmd(f"hyprctl dispatch moveactive {x} {y}")
            result = subprocess.run(f"hyprctl dispatch moveactive {pos.x()+X_OFFEST} {pos.y()+Y_OFFSET}", shell=True, capture_output=True, text=True)
        # return result.stdout.strip(), result.stderr.strip(), result.returncode
        self.move(x, y)


def insure_no_leftover_file():
    directory = HIDE_DIR
    files = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]

    json_files = []
    for f in files:
        _, extension = os.path.splitext(f)
        if extension == '.json':
            json_files.append(f)

    clients = get_hyprctl_clients()
    client_files = [f"{i['address']}.json" for i in clients]

    for jf in json_files:
        if jf not in client_files:
            # Delete JSON file
            json_path = os.path.join(HIDE_DIR, jf)
            os.remove(json_path)

            # Delete corresponding PNG file
            name, _ = os.path.splitext(jf)
            png_path = os.path.join(HIDE_DIR, f"{name}.png")
            if os.path.exists(png_path):
                os.remove(png_path)



def safety_check_generate_missing_json_files():
    threshold = 900  # pixels around (5000, 5000)
    try:
        output = subprocess.check_output(["hyprctl", "clients", "-j"], text=True)
        clients = json.loads(output)
        far_clients = [
        c for c in clients
            if c["at"][0] > 5000 or c["at"][1] > 5000
        ]
        for client in far_clients:
            addr = client.get("address")
            x, y = client.get("at", [0, 0])
            title = client.get("title", "Unknown")
            app_class = client.get("class", "Unknown")
            workspace = client.get("workspace", {}).get("id", 1)
            floating = client.get("floating", False)


            json_path = os.path.join(HIDE_DIR, f"{addr}.json")
            if os.path.exists(json_path):
                continue

            # Check if window is near (5000, 5000)
            os.makedirs(HIDE_DIR, exist_ok=True)
            data = {
                "address": addr,
                "title": title,
                "class": app_class,
                "at": [x, y],
                "workspace": {"id": workspace},
                "floating":floating
            }
            print(data)
            with open(json_path, "w") as f:
                json.dump(data, f, indent=2)
            print(f"[Safety Check] Created rudimentary file for: {addr}")

    except Exception as e:
        print(f"[Safety Check] Failed to check or create json: {e}")

class HyprHideAppInitWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("HyprHide Setup")
        self.setFixedSize(460, 300)
        self.setWindowFlag(Qt.WindowType.WindowStaysOnTopHint, True)
        self.setWindowFlag(Qt.WindowType.Tool)

        self.setStyleSheet("""
            QWidget {
                background-color: #1e1e1e;
                color: #dddddd;
                font-size: 10pt;
            }
            QCheckBox {
                spacing: 8px;
            }
            QPushButton {
                background-color: #2a2a2a;
                border: 1px solid #444444;
                border-radius: 6px;
                padding: 6px 12px;
            }
            QPushButton:hover {
                background-color: #3a3a3a;
            }
            QLabel {
                font-weight: bold;
                padding: 6px;
            }
        """)

        self.layout = QVBoxLayout()
        self.layout.setContentsMargins(20, 20, 20, 20)
        self.setLayout(self.layout)

        self.label = QLabel("Initial Setup")
        self.layout.addWidget(self.label)
        
        # Thumbnails checkbox
        self.cb_thumbnails = QCheckBox("Enable thumbnails for hidden windows(Currently not used option)")
        self.cb_thumbnails.setChecked(True)
        self.layout.addWidget(self.cb_thumbnails)

        # Jump-to-mouse checkbox
        self.cb_jump_mouse = QCheckBox("Enable jump-to-mouse positioning (experimental)")
        self.cb_jump_mouse.setToolTip("Buggy. Moves app near cursor using X/Y offset.")
        self.layout.addWidget(self.cb_jump_mouse)

        # Waybar detection
        self.cb_waybar = QCheckBox("Integrate with Waybar")
        self.cb_waybar.setToolTip("Show HyprHide in Waybar if it's installed")
        if not self.is_waybar_installed():
            self.cb_waybar.setEnabled(False)
            self.cb_waybar.setToolTip("Waybar not detected on system")
        self.layout.addWidget(self.cb_waybar)
        #Hyprland detection
        

        # Connect checkbox toggle to enable/disable keybind input
        self.cb_hyprland = QCheckBox("Integrate with Hyprland")
        self.cb_hyprland.setToolTip("Add Keybinds for Hyprland(experimental)")
        if not self.is_hyprland_installed():
            self.cb_hyprland.setEnabled(False)
            self.cb_hyprland.setToolTip("Hyprland not detected on system")
        self.layout.addWidget(self.cb_hyprland)
        self.keybind_input = QLineEdit()
        self.keybind_input.setPlaceholderText("Enter keybind like SUPER,H")
        self.keybind_input.setEnabled(False)  # Initially disabled
        self.layout.addWidget(self.keybind_input)
        self.cb_hyprland.stateChanged.connect(self.toggle_keybind_input)
        
        # Save button
        self.btn_save = QPushButton("Finish Setup")
        self.btn_save.clicked.connect(self.save_config_and_launch)
        self.layout.addWidget(self.btn_save)
        self.label = QLabel("Important\n\tmin.sh is at /usr/bin/hyprhide-min\n\tYou should either bind it to a \n\t\tkeybind, or create another way to trigger it")
        self.layout.addWidget(self.label)
    def toggle_keybind_input(self, state):
        print("HELLI",state)
        self.keybind_input.setEnabled(state == 2)
    def is_waybar_installed(self):
        return any(os.access(os.path.join(path, "waybar"), os.X_OK) for path in os.environ["PATH"].split(os.pathsep))
    def is_hyprland_installed(self):
        return os.path.exists(os.path.expanduser("~/.config/hypr/hyprland.conf"))
    def install_into_hyprland(self):
        hyprcfg = os.path.expanduser("~/.config/hypr/hyprland.conf")
        data = ""
        with open(hyprcfg,"r") as hypr_file:
            data = hypr_file.read()
            if(self.keybind_input.isEnabled() == True):
                if("," in self.keybind_input.text()):
                    line = f"bind = {self.keybind_input.text()},exec,hyprhide-min"
                else:
                    line = f"bind = SUPER,H,exec,hyprhide-min"
            data = data+"\n"+line
        with open(hyprcfg,"w") as hypr_file:
            hypr_file.write(data)
        os.system("hyprctl")
    def install_into_waybar(self):
        waybar_cfg = os.path.expanduser("~/.config/hypr/config")
        waybar_modules_c = os.path.expanduser("~/.config/waybar/modules/modules-custom.json ")
        if(os.path.exists(waybar_cfg) != True or s.path.exists(waybar_modules_c) != True):
            return -1
        else:
            with open(waybar_cfg, "r") as waybar_cfg:
                waybar_json = json.load(waybar_cfg)

            modules_right = waybar_json['modules-right']
            modules_first = modules_right[0]
            modules_second_to_end = modules_right[1:]

            # Create new modules list with "custom/hyprhide" inserted second
            new_mod = [modules_first, "custom/hyprhide"] + modules_second_to_end

            # Update the JSON structure
            waybar_json['modules-right'] = new_mod

            # Write the updated JSON back to the file
            with open(waybar_cfg, "w") as waybar_cfg:
                json.dump(waybar_json, waybar_cfg, indent=4)
            waybar_modules_c_json = commentjson.load(open(waybar_modules_c))
            waybar_modules_c_json['custom/hyprhide'] = {
            "exec": "echo '🗔'",  # This will be the button label (icon)
            "interval": 0,
            "on-click": "python3 usr/bin/hyprhide-gui",
            "tooltip-format": "Press to see all hidden windows"
        }

    def save_config_and_launch(self):
        os.makedirs(os.path.dirname(user_config_path), exist_ok=True)

        config["INIT"] = {"first": "False"}
        config["GUI"] = {
            "THUMBNAILS": str(self.cb_thumbnails.isChecked()),
            "JUMP_TO_MOUSE": str(self.cb_jump_mouse.isChecked()),
            "X_OFFEST": str(X_OFFEST),
            "Y_OFFSET": str(Y_OFFSET),
        }
        config["WAYBAR"] = {"ENABLED": str(self.cb_waybar.isChecked())}

        with open(user_config_path, "w") as cfgfile:
            config.write(cfgfile)
        if(self.cb_waybar.isChecked() == True):
            self.install_into_waybar()
        if(self.cb_hyprland.isChecked() ==  True):
            self.install_into_hyprland()
        self.close()
        self.main_app = HyprHideApp()
        self.main_app.position_near_mouse()
        self.main_app.show()

if __name__ == "__main__":
    first_run = config.get("INIT","first",fallback=True)
    if(first_run == True):
        app = QApplication(sys.argv)
        signal.signal(signal.SIGINT, signal.SIG_DFL)
        # safety_check_generate_missing_json_files()
        window = HyprHideAppInitWindow()
        # Immediately move near mouse
        # window.position_near_mouse()
        window.show()
        sys.exit(app.exec())
    else:

        app = QApplication(sys.argv)
        signal.signal(signal.SIGINT, signal.SIG_DFL)
        insure_no_leftover_file()
        safety_check_generate_missing_json_files()
        window = HyprHideApp()
        # Immediately move near mouse
        window.position_near_mouse()
        window.show()
        sys.exit(app.exec())
