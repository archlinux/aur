#!/usr/bin/env python3
# Imports
import os
import json
import subprocess
import time
import sys
import signal
import configparser
import commentjson
import argparse
import hyprland_interface
from PyQt6.QtGui import QFont, QPixmap, QIcon, QCursor
from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QLabel,
    QScrollArea,QCheckBox,QPushButton,QSpinBox, QGroupBox,QHBoxLayout
)
from PyQt6.QtCore import (
    Qt, QTimer, QPropertyAnimation, QEasingCurve,pyqtSignal
)
from PyQt6.QtWidgets import QGraphicsOpacityEffect
from PyQt6.QtWidgets import QLineEdit, QGridLayout

#Default Version info
VERSION = "1.9.8"

#Setup config parser
config = configparser.ConfigParser()

#Expand config path
user_config_path = os.path.expanduser("~/.config/hyprhide/config.cfg")

#Ensure Path exists
if os.path.exists(user_config_path):
    config.read(user_config_path) # Load config path
else:
    #Print Error message
    #Only known error here could be disk corruption
    print("Please create a config.cfg file, or install this properly ")

#Load some configs
JUMP_TO_MOUSE = config.get('GUI', 'jump_to_mouse', fallback=False) # Should the GUI move to the mouse
X_OFFSET = int(config.get('GUI', 'x_offset', fallback=-240)) # the x offset from the mouse(mouse_x+X_OFFSET)
Y_OFFSET = int(config.get('GUI', 'y_offset', fallback=160)) # the y offset from the mouse(mouse_y+Y_OFFSET)


HIDE_DIR = os.path.expanduser("~/.local/share/hypr-hide") # Dir where the .json and .png files go

# Internal Widget to display windows
class HiddenWindowItem(QWidget):
    restore_complete = pyqtSignal() # Signal that connects to exit system
    def __init__(self, address, title, app_class, x, y, workspace,was_floating):
        super().__init__()
        self.address = address # Window address to restore
        self.x = x # X pos to put the window at
        self.y = y # Y pos to put the window at
        self.workspace = workspace # Workspace to put the window at
        self.was_floating = was_floating # Wether or not the window was closed be
        self.title = title # Title of the window
        self.app_class = app_class # Class of the window

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
        self.setWindowOpacity(0.95) # Make window slightly clear
        self.setCursor(Qt.CursorShape.PointingHandCursor) # Set the cursor type

        # Setup layout for window
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
            self.close()
            
    # Run a command(Becoming Deprecated)
    def run_cmd(self, cmd):
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        return result.stdout.strip(), result.stderr.strip(), result.returncode
    # Function to restore the window
    def on_restore_clicked(self):
        client_data = hyprland_interface.get_client_info(self.address) # Ge the current client info
        print(f"Restoring window {self.title} at {self.x},{self.y} on workspace {self.workspace}") # Debug output
        print(f"Window floating state = {self.was_floating}") # Debug output
        window_floating_state_before_move = self.was_floating # Create variable for ease of read
        print(self.workspace) # Print workspace window should go to
        hyprland_interface.set_current_workspace(workspace=self.workspace) # Set current workspace
        time.sleep(0.3) # Minor delay
        hyprland_interface.focus_window(self.address) # Set the window to be restored into focus(Might be redundant)
        time.sleep(0.3) # Minor delay
        hyprland_interface.move_win_to_workspace(self.address,self.workspace) # Move window to workspace
        test_data = hyprland_interface.get_client_info(self.address) # Grab current state of window
        print(test_data["workspace"]) # Debug output
        if(client_data['floating'] == False): # Check if window is floating(need to be to move)
            hyprland_interface.toggle_floating(self.address) # Set window to floating
        if(test_data["workspace"]['id'] != self.workspace): # Check if window is on right workspace(Edge cases can move)
            print("Move again") # Debug output
            hyprland_interface.move_win_to_workspace(self.address,self.workspace)# Move window to workspace again
        hyprland_interface.focus_window(self.address) # Focus window once more
        hyprland_interface.move_window_local(self.address,self.x,self.y) # Attempt to move window(Hyprland dose not seem to honor this always)

        #|------------------------------------------------------------|#
        #| Window is now considered restored. We now do safety checks.|#
        #|------------------------------------------------------------|#
        
        if(self.was_floating != client_data['floating']): # Insure window is in initial state(tiled/floating)
            hyprland_interface.toggle_floating(self.address) # If not, toggle it
        client_data = hyprland_interface.get_client_info(self.address) # Ge the current client info(Second time)
        if(self.was_floating != client_data['floating']): # Do another check
            hyprland_interface.toggle_floating(self.address) # Toggle window if states dont match
        
        #|------------------------------------------------------------|#
        #| Safety checks are done. Now we clean up.                   |#
        #|------------------------------------------------------------|#
        
        json_path = os.path.join(HIDE_DIR, f"{self.address}.json") # Get path of json file
        try:
            os.remove(json_path) # Try remove it
        except Exception as e:
            print(f"Failed to remove {json_path}: {e}") # Error output

        img_path = os.path.join(HIDE_DIR, f"{self.address}.png") # Get path of thumbnail
        try:
            if os.path.exists(img_path): # Check if it exists
                os.remove(img_path) # Remove it
        except Exception as e:
            print(f"Failed to remove screenshot {img_path}: {e}") # Error output

        print("Restore complete.") # Output

        # One more final floating/tiled safety check
        check_state_c = hyprland_interface.get_client_info(self.address) # get window info
        window_floating_state_after_move = check_state_c['floating'] # Get current floating state
        if(window_floating_state_after_move == window_floating_state_before_move): # check if they match
            print("I did this right") # Positive Affirmations
        else:
            hyprland_interface.toggle_floating(self.address) # Final attempt at setting the toggle state

        print(f"Window floating state = {check_state_c['floating']}")# Output floating state
        hyprland_interface.move_win_to_workspace(self.address,self.workspace) # One final move to correct workspace
        self.restore_complete.emit() # Emit completion code

    
def get_focused_monitor_geometry():
    result = subprocess.run("hyprctl monitors -j", shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"hyprctl error: {result.stderr}")
        return {"x": 0, "y": 0, "width": 1920, "height": 1080}  # fallback

    monitors = json.loads(result.stdout)
    for monitor in monitors:
        if monitor.get("focused", False):
            return {
                "x": monitor["x"],
                "y": monitor["y"],
                "width": monitor["width"],
                "height": monitor["height"]
            }
    
    return {"x": 0, "y": 0, "width": 1920, "height": 1080}  # fallback
class HyprHideApp(QWidget):
    def __init__(self):
        super().__init__()
        self.title = f"HyprHide {VERSION}"
        self.setWindowTitle(self.title)
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

        # QTimer.singleShot(10, self.position_near_mouse)

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
                        item.restore_complete.connect(self.close) 
                        self.window_items.append(item)
                        self.grid_layout.addWidget(item, row, col)
                        col += 1
                        if col >= 3:
                            row += 1
                            col = 0
                except Exception as e:
                    print(f"Error loading {file}: {e}")
        self.close()
        
    def filter_items(self, text):
        text = text.lower()
        for i in range(self.grid_layout.count()):
            item = self.grid_layout.itemAt(i).widget()
            visible = text in item.title.lower() or text in item.app_class.lower()
            item.setVisible(visible)

    def closeEvent(self, event):
        QApplication.quit()

    def position_near_mouse(self):
        # if not self.isVisible():
        #     QTimer.singleShot(10, self.position_near_mouse)
        #     return

        pos = QCursor.pos()  # Global mouse pos
        monitor = get_focused_monitor_geometry()

        win_width = self.frameGeometry().width()
        win_height = self.frameGeometry().height()

        # Offset adjustments
        frame_offset_x = self.frameGeometry().x() - self.geometry().x()

        # Clamp mouse position to monitor bounds
        mouse_x = min(max(pos.x(), monitor["x"]), monitor["x"] + monitor["width"] - 1)
        mouse_y = min(max(pos.y(), monitor["y"]), monitor["y"] + monitor["height"] - 1)

        if JUMP_TO_MOUSE == 'True':
            adjusted_x = mouse_x - frame_offset_x + X_OFFSET - 240

            adjusted_y = mouse_y + (win_height // 4) + Y_OFFSET

            # Clamp inside monitor bounds
            adjusted_x = max(monitor["x"], min(adjusted_x, monitor["x"] + monitor["width"] - win_width))
            adjusted_y = max(monitor["y"], min(adjusted_y, monitor["y"] + monitor["height"] - win_height))

            # print(f"Monitor bounds: {monitor}")
            # print(f"Adjusted X: {adjusted_x}, Adjusted Y: {adjusted_y}")
            # print(f"Moving screen to {adjusted_x},{adjusted_y}")
            # print(f"Mouse at {mouse_x},{mouse_y}")

            # result = subprocess.run(f"hyprctl dispatch moveactive {adjusted_x} {adjusted_y}",
            #                         shell=True, capture_output=True, text=True)
            # if result.returncode != 0:
            #     print(f"hyprctl error: {result.stderr}")
            hyprhide_window = hyprland_interface.get_window_by_class_and_title(title=self.title,class_in="python3")
            address_to_use = hyprhide_window['address']
            active_workspace = hyprland_interface.get_active_workspace_id()
            # hyprland_interface.move_win_to_workspace(address_to_use,active_workspace)
            # hyprland_interface.set_current_workspace(active_workspace)
            print("Move to mouse")
            # active_workspace = hyprland_interface.get_active_workspace_id()
            hyprland_interface.move_window_global(address_to_use,pos.x(),pos.y(),active_workspace)


def insure_no_leftover_file():
    directory = HIDE_DIR
    files = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]

    json_files = []
    for f in files:
        _, extension = os.path.splitext(f)
        if extension == '.json':
            json_files.append(f)

    clients = hyprland_interface.get_clients()
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
            self.address = client.get("address")
            x, y = client.get("at", [0, 0])
            title = client.get("title", "Unknown")
            app_class = client.get("class", "Unknown")
            workspace = client.get("workspace", {}).get("id", 1)
            floating = client.get("floating", False)


            json_path = os.path.join(HIDE_DIR, f"{self.address}.json")
            if os.path.exists(json_path):
                continue

            # Check if window is near (5000, 5000)
            os.makedirs(HIDE_DIR, exist_ok=True)
            data = {
                "address": self.address,
                "title": title,
                "class": app_class,
                "at": [x, y],
                "workspace": {"id": workspace},
                "floating":floating
            }
            print(data)
            with open(json_path, "w") as f:
                json.dump(data, f, indent=2)
            print(f"[Safety Check] Created rudimentary file for: {self.address}")

    except Exception as e:
        print(f"[Safety Check] Failed to check or create json: {e}")

class HyprHideAppInitWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("HyprHide Setup")
        self.setFixedSize(560, 520)
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

        main_layout = QVBoxLayout()
        main_layout.setContentsMargins(20, 20, 20, 20)
        main_layout.setSpacing(15)
        self.setLayout(main_layout)

        # Title label
        title_label = QLabel("Initial Setup")
        title_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        main_layout.addWidget(title_label)

        # --- Thumbnails option ---
        self.cb_thumbnails = QCheckBox("Enable thumbnails for hidden windows")
        self.cb_thumbnails.setChecked(True)
        main_layout.addWidget(self.cb_thumbnails)

        # --- Dropdown mode group ---
        dropdown_group = QGroupBox("Dropdown Mode")
        dropdown_group.setStyleSheet("QGroupBox { font-weight: bold; }")
        dropdown_layout = QVBoxLayout()
        dropdown_group.setLayout(dropdown_layout)

        self.cb_jump_mouse = QCheckBox("Enable Dropdown mode(experimental)")
        self.cb_jump_mouse.setToolTip("Moves window to mouse position. Only use if GUI is launched from a bar")
        dropdown_layout.addWidget(self.cb_jump_mouse)

        # Offsets inputs with spinboxes for better UX
        offset_layout = QHBoxLayout()
        self.x_offset = QSpinBox()
        self.x_offset.setRange(-1000, 1000)
        self.x_offset.setPrefix("X: ")
        self.x_offset.setEnabled(False)
        self.x_offset.setToolTip("Horizontal offset in pixels")
        offset_layout.addWidget(self.x_offset)

        self.y_offset = QSpinBox()
        self.y_offset.setRange(-1000, 1000)
        self.y_offset.setPrefix("Y: ")
        self.y_offset.setEnabled(False)
        self.y_offset.setToolTip("Vertical offset in pixels")
        offset_layout.addWidget(self.y_offset)

        dropdown_layout.addLayout(offset_layout)
        main_layout.addWidget(dropdown_group)

        self.cb_jump_mouse.stateChanged.connect(self.toggle_offset_inputs)

        # --- Integration group ---
        integration_group = QGroupBox("Integrations")
        integration_group.setStyleSheet("QGroupBox { font-weight: bold; }")
        integration_layout = QVBoxLayout()
        integration_group.setLayout(integration_layout)

        # Waybar
        self.cb_waybar = QCheckBox("Integrate with Waybar")
        self.cb_waybar.setToolTip("Show HyprHide in Waybar if installed")
        if not self.is_waybar_installed():
            self.cb_waybar.setEnabled(False)
            self.cb_waybar.setToolTip("Waybar not detected on system")
        integration_layout.addWidget(self.cb_waybar)

        # Hyprland
        self.cb_hyprland = QCheckBox("Integrate with Hyprland (experimental)")
        self.cb_hyprland.setToolTip("Add keybinds for Hyprland")
        if not self.is_hyprland_installed():
            self.cb_hyprland.setEnabled(False)
            self.cb_hyprland.setToolTip("Hyprland not detected on system")
        integration_layout.addWidget(self.cb_hyprland)

        self.keybind_input = QLineEdit()
        self.keybind_input.setPlaceholderText("Enter keybind (e.g. SUPER,H)")
        self.keybind_input.setEnabled(False)
        integration_layout.addWidget(self.keybind_input)

        self.cb_hyprland.stateChanged.connect(self.toggle_keybind_input)

        main_layout.addWidget(integration_group)

        # --- Developer Settings (collapsed by default) ---
        self.dev_group = QGroupBox("Developer Settings")
        self.dev_group.setCheckable(True)
        self.dev_group.setChecked(False)
        self.dev_group.setStyleSheet("QGroupBox { font-weight: bold; }")

        dev_layout = QVBoxLayout()
        self.dev_group.setLayout(dev_layout)

        # Developer mode checkbox
        self.cb_developer_mode = QCheckBox("Enable Developer Mode")
        self.cb_developer_mode.setToolTip("Runs local development Python script instead of installed binary")
        self.cb_developer_mode.stateChanged.connect(self.toggle_dev_path_option)
        dev_layout.addWidget(self.cb_developer_mode)

        # Developer script path input
        self.dev_path_input = QLineEdit()
        self.dev_path_input.setPlaceholderText("Path to local Python script (e.g. ./dev/main.py)")
        self.dev_path_input.setToolTip("Dev runner will expand local paths")
        self.dev_path_input.setEnabled(False)  # Initially disabled
        dev_layout.addWidget(self.dev_path_input)

        main_layout.addWidget(self.dev_group)
        
        # Spacer to push buttons to bottom
        main_layout.addStretch()

        # Save button
        self.btn_save = QPushButton("Finish Setup")
        self.btn_save.clicked.connect(self.save_config_and_launch)
        main_layout.addWidget(self.btn_save)

        # Info label
        info_text = (
            "Important:\n"
            "\tmin.sh is at /usr/bin/hyprhide-min\n"
            "\tYou should bind it to a keybind,\n"
            "\tor create another way to trigger it."
        )
        info_label = QLabel(info_text)
        info_label.setStyleSheet("font-weight: normal;")
        # main_layout.addWidget(info_label)
    def toggle_dev_path_option(self,state):
        self.dev_path_input.setEnabled(state == 2)
    def toggle_keybind_input(self, state):
        print("HELLI",state)
        self.keybind_input.setEnabled(state == 2)
    def toggle_offset_inputs(self,state):
        self.x_offset.setEnabled(state == 2)
        self.y_offset.setEnabled(state == 2)

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
        waybar_cfg = os.path.expanduser("~/.config/waybar/config")
        waybar_modules_c = os.path.expanduser("~/.config/waybar/modules/modules-custom.jsonc")

        if not os.path.exists(waybar_cfg):
            print(f"Broken: No cfg at {waybar_cfg}")
            return -1
        if not os.path.exists(waybar_modules_c):
            print(f"Broken: No modules at {waybar_modules_c}")
            return -1

        print("Install")

        # Use commentjson to load config with comments/trailing commas
        with open(waybar_cfg, "r") as waybar_cfg_file:
            waybar_json = commentjson.load(waybar_cfg_file)

        modules_right = waybar_json.get('modules-right', [])
        if not modules_right:
            print("No modules-right found in waybar config")
            return -1

        modules_first = modules_right[0]
        modules_second_to_end = modules_right[1:]

        # Insert custom module second in list
        new_mod = [modules_first, "custom/hyprhide"] + modules_second_to_end
        waybar_json['modules-right'] = new_mod

        # Write updated config back (using commentjson.dump to preserve JSONC style)
        with open(waybar_cfg, "w") as waybar_cfg_file:
            commentjson.dump(waybar_json, waybar_cfg_file, indent=4)

        # Load modules-custom.jsonc
        with open(waybar_modules_c, "r") as mod_file:
            waybar_modules_c_json = commentjson.load(mod_file)

        # Add your custom/hyprhide module config
        waybar_modules_c_json['custom/hyprhide'] = {
            "exec": "echo '🗔'",  # Button label (icon)
            "interval": 0,
            "on-click": "python3 /usr/bin/hyprhide-gui",
            "tooltip-format": "Press to see all hidden windows"
        }

        # Write updated modules-custom.jsonc back
        with open(waybar_modules_c, "w") as mod_file:
            commentjson.dump(waybar_modules_c_json, mod_file, indent=4)

    def save_config_and_launch(self):
        os.makedirs(os.path.dirname(user_config_path), exist_ok=True)

        config["INIT"] = {"first": "False"}
        config["GUI"] = {
            "THUMBNAILS": str(self.cb_thumbnails.isChecked()),
            "JUMP_TO_MOUSE": str(self.cb_jump_mouse.isChecked()),
            "X_OFFSET": str(self.x_offset.value()),
            "Y_OFFSET": str(self.y_offset.value()),
        }
        config["WAYBAR"] = {"ENABLED": str(self.cb_waybar.isChecked())}

        
        if(self.cb_waybar.isChecked() == True):
            print("Installing")
            self.install_into_waybar()
        if(self.cb_hyprland.isChecked() ==  True):
            self.install_into_hyprland()
        if self.cb_developer_mode.isChecked() == True:
            if not config.has_section("DEV"):
                config.add_section("DEV")
            print("Setting this")
            config.set("DEV","devmode",'True')
            deb_path = self.dev_path_input.text()
            config.set("DEV","hyprhide_src",deb_path)
            print(config.get("DEV","devmode",fallback="Know it"))
        with open(user_config_path, "w") as cfgfile:
            config.write(cfgfile)
        self.close()
        self.main_app = HyprHideApp()
        self.main_app.position_near_mouse()
        self.main_app.show()

if __name__ == "__main__":
   
    parser = argparse.ArgumentParser(description="HyprHide Application")
    parser.add_argument("--reset", action="store_true", help="Reset initial setup")
    parser.add_argument("--launched", action="store_true", help="Used internally")
    parser.add_argument("--set-version", type=str, help="Specify the version")
    
    args = parser.parse_args()
    VERSION = args.set_version
    if(args.launched != True):
        exit()
    if args.reset:
         
         config.set("INIT", "first", True)
    first_run = config.getboolean("INIT","first",fallback=True)
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
#0x56090b1d9f60