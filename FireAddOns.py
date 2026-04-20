import importlib, sys, re, os
import shutil, psutil

import gi
gi.require_version('Gtk', '4.0')
from gi.repository import GLib, Gtk, Gdk
from SaveManager import DownloadDatabase

def lazy_import(name):
    spec = importlib.util.find_spec(name)
    if spec is None or spec.loader is None:
        raise ImportError(f"Module '{name}' could not be found for lazy import.")
    loader = importlib.util.LazyLoader(spec.loader)
    spec.loader = loader
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    loader.exec_module(module)
    return module

class _FileManager():
    def __init__(self):
        if os.name == 'nt':
            base_config = os.getenv('APPDATA', os.path.expanduser('~'))
            base_data = os.getenv('LOCALAPPDATA', base_config)
            self.config_dir = os.path.join(base_data, "flameget")
            self.data_dir = os.path.join(base_data, "flameget")
        else:
            self.config_dir = os.path.join(GLib.get_user_config_dir(), "flameget")
            self.data_dir = os.path.join(GLib.get_user_data_dir(), "flameget")

        os.makedirs(self.config_dir, exist_ok=True)
        os.makedirs(self.data_dir, exist_ok=True)

        self.db_file = os.path.join(self.data_dir, "downloads.db")
        self.db = DownloadDatabase(db_name=self.db_file)
        
        self.is_compiled = getattr(sys, 'frozen', False) or "__compiled__" in globals()
        
        if self.is_compiled:
            self.current_exe = sys.executable
            self.install_dir = os.path.dirname(self.current_exe)
            ext = ""
        else:
            self.current_exe = sys.executable
            self.install_dir = os.path.dirname(os.path.abspath(__file__))
            ext = ".py"

        self.downloader_script_path = os.path.join(self.install_dir, f"downloader{ext}")
        self.browser_context_menu_handler_script_path = os.path.join(self.install_dir, f"browser_context_menu_handler{ext}")
        self.server_script_path = os.path.join(self.install_dir, f"server{ext}")
        
        if self.is_compiled:
            self.tray_script_path = os.path.join(self.install_dir, "binaries",  "tray.exe" if os.name =="nt" else "tray.bin")
        else:
            self.tray_script_path = os.path.join(self.install_dir, "tray.py")

        self.aria2c_path = "aria2c" if os.name != "nt" else os.path.join(self.install_dir, "binaries", "aria2c.exe")
            
        self.binaries_path = os.path.join(self.install_dir, "binaries")
        self.icons_dir = os.path.join(self.install_dir, "icons")
        self.ffmpeg_path = os.path.join(self.binaries_path, "ffmpeg.exe") if os.name == "nt" else shutil.which("ffmpeg")
        display = Gdk.Display.get_default()
        icon_theme = Gtk.IconTheme.get_for_display(display)
        icon_theme.add_search_path(self.icons_dir)
        
        editable_files = ["translations.json", "dark_style.css", "light_style.css", "custom_style.css"]
        
        for filename in editable_files:
            user_path = os.path.join(self.config_dir, filename)
            if self.is_compiled:
                system_path = os.path.join(self.install_dir, "_internal", filename)
            else:
                system_path = os.path.join(self.install_dir, filename)
            if not os.path.exists(user_path):
                if os.path.exists(system_path):
                    try:
                        if self.is_compiled:
                            shutil.move(system_path, user_path)
                        else:
                            shutil.copy2(system_path, user_path)
                        print(f"Copied default {filename} to user config.")
                    except Exception as e:
                        print(f"Failed to copy {filename}: {e}")
                else:
                    open(user_path, 'a').close()
                    print(f"making empty one {filename}")

FireFiles = _FileManager()

class UNITS():
    def get_temp_dir():
        if os.name == 'nt':
            base_data = os.getenv('LOCALAPPDATA', os.path.expanduser('~'))
            RUNTIME_DIR = os.path.join(base_data, "flameget", "run")
            os.makedirs(RUNTIME_DIR, exist_ok=True)
            return RUNTIME_DIR
        else:
            return os.environ.get("XDG_RUNTIME_DIR", "/tmp")
        
    SIZE_RE = re.compile(r"/([0-9.]+)([KMG]i?)B", re.I)
    
    RUNTIME_DIR = get_temp_dir()
   
    MULT = {
        "b": 1, "byte": 1, "bytes": 1,

        "k": 1000, "kb": 1000, 
        "ki": 1024, "kib": 1024,

        "m": 1000**2, "mb": 1000**2, 
        "mi": 1024**2, "mib": 1024**2,

        "g": 1000**3, "gb": 1000**3, 
        "gi": 1024**3, "gib": 1024**3,

        "t": 1000**4, "tb": 1000**4, 
        "ti": 1024**4, "tib": 1024**4,

        # WHO THE FUCK HAS THIS AMOUNT OF DATA DAYUUM
        "p": 1000**5, "pb": 1000**5, 
        "pi": 1024**5, "pib": 1024**5,
    }
    COMPRESSED = {
        ".zip", ".rar", ".7z", ".tar", ".gz", ".bz2", ".xz",
        ".tgz", ".tbz2", ".txz", ".zst", ".iso"
    }
    PROGRAMS = {
        ".exe", ".msi", ".apk", ".appimage", ".deb", ".rpm",
        ".run", ".bin", ".sh"
    }
    VIDEOS = {
        ".mp4", ".mkv", ".avi", ".mov", ".wmv", ".flv",
        ".webm", ".mpeg", ".mpg", ".m4v"
    }
    MUSIC = {
        ".mp3", ".flac", ".wav", ".ogg", ".aac", ".m4a",
        ".opus", ".wma"
    }
    PICTURES = {
        ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp",
        ".tiff", ".svg", ".avif"
    }
    DOCUMENTS = {
        ".pdf", ".doc", ".docx", ".odt", ".rtf", ".txt",
        ".md", ".ppt", ".pptx", ".xls", ".xlsx", ".ods",
        ".csv", ".epub"
    }
    SUPPORTED_SITES = {
        "youtube.com", "youtu.be",
        "twitch.tv", "tiktok.com",
        "instagram.com", "facebook.com", "fb.watch",
        "twitter.com", "x.com",
        "vimeo.com", "dailymotion.com",
        "soundcloud.com", "mixcloud.com",
        "reddit.com", "pinterest.com",
        "bilibili.com", "vk.com", 
        "odysee.com", "rumble.com",
        "streamable.com"
    }


def categorize_filename(filename, is_torrent=False):
    ext = os.path.splitext(filename.lower())[1]
    if is_torrent:
        return "Torrent"
    if ext in UNITS.COMPRESSED:
        return "Compressed"
    if ext in UNITS.PROGRAMS:
        return "Programs"
    if ext in UNITS.VIDEOS:
        return "Videos"
    if ext in UNITS.MUSIC:
        return "Music"
    if ext in UNITS.PICTURES:
        return "Pictures"
    if ext in UNITS.DOCUMENTS:
        return "Documents"

    return "Documents"

#for the downloader
def parse_size(file_size_in_bytes):
    return (
        f"{file_size_in_bytes} B" if file_size_in_bytes < 1024 else
        f"{file_size_in_bytes / 1024:.2f} KB" if file_size_in_bytes < 1024**2 else
        f"{file_size_in_bytes / (1024 ** 2):.2f} MB" if file_size_in_bytes < 1024**3 else
        f"{file_size_in_bytes / (1024 ** 3):.2f} GB" if file_size_in_bytes < 1024**4 else
        f"{file_size_in_bytes / (1024 ** 4):.2f} TB"
    )

def range_parse_size(val, unit):
    unit = unit.lower()
    if not unit.endswith("b"):
        unit += "b"

    return int(float(val) * UNITS.MULT[unit])

def is_pid_alive(pid: int) -> bool:
    return psutil.pid_exists(pid)

def set_titlebar_theme(window_title, theme_str="Dark"):
    if os.name != 'nt':
        return
    
    import ctypes    
    try:
        hwnd = ctypes.windll.user32.FindWindowW(None, window_title)
        
        if hwnd:
            DWMWA_USE_IMMERSIVE_DARK_MODE = 20
            
            # If dark_mode is True, send 1. If False, send 0.
            dark_mode = 1 if theme_str == "Dark" else 0
            set_theme = ctypes.c_int(dark_mode)
            
            ctypes.windll.dwmapi.DwmSetWindowAttribute(
                hwnd,
                DWMWA_USE_IMMERSIVE_DARK_MODE,
                ctypes.byref(set_theme),
                ctypes.sizeof(set_theme)
            )
            print(f"Successfully set Windows title bar to {theme_str} mode.")
        else:
            print("Could not find window to apply title bar theme.")
            
    except Exception as e:
        print(f"DWM API failed: {e}")

import os
import ctypes
from ctypes import wintypes

def force_center_dialog(dialog_title, parent_title=None):
    if os.name != 'nt':
        return False 

    user32 = ctypes.windll.user32
    
    user32.FindWindowW.restype = wintypes.HWND
    user32.FindWindowW.argtypes = [wintypes.LPCWSTR, wintypes.LPCWSTR]
    
    user32.GetWindowRect.restype = wintypes.BOOL
    user32.GetWindowRect.argtypes = [wintypes.HWND, ctypes.POINTER(wintypes.RECT)]
    
    user32.SetWindowPos.restype = wintypes.BOOL
    user32.SetWindowPos.argtypes = [wintypes.HWND, wintypes.HWND, ctypes.c_int, ctypes.c_int, ctypes.c_int, ctypes.c_int, ctypes.c_uint]

    hwnd_dialog = user32.FindWindowW(None, dialog_title)
    if not hwnd_dialog:
        print(f"DEBUG: Could not find window with title '{dialog_title}'")
        return False
        
    rect_dlg = wintypes.RECT()
    user32.GetWindowRect(hwnd_dialog, ctypes.byref(rect_dlg))
    dlg_width = rect_dlg.right - rect_dlg.left
    dlg_height = rect_dlg.bottom - rect_dlg.top
    
    hwnd_main = user32.FindWindowW(None, parent_title) if parent_title else None
    
    if hwnd_main:
        rect_main = wintypes.RECT()
        user32.GetWindowRect(hwnd_main, ctypes.byref(rect_main))
        main_width = rect_main.right - rect_main.left
        main_height = rect_main.bottom - rect_main.top
        
        x = rect_main.left + (main_width - dlg_width) // 2
        y = rect_main.top + (main_height - dlg_height) // 2
    else:
        SM_CXSCREEN = 0
        SM_CYSCREEN = 1
        screen_width = user32.GetSystemMetrics(SM_CXSCREEN)
        screen_height = user32.GetSystemMetrics(SM_CYSCREEN)
        
        x = (screen_width - dlg_width) // 2
        y = (screen_height - dlg_height) // 2
        
    HWND_TOPMOST = ctypes.c_void_p(-1)
    SWP_NOSIZE = 0x0001
    
    user32.SetWindowPos(hwnd_dialog, HWND_TOPMOST, x, y, 0, 0, SWP_NOSIZE)
    
    return False
