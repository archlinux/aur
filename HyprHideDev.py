#!/usr/bin/env python3
import os
import configparser
import argparse

def get_version():
    version_path = '/usr/share/hyprhide/version.txt'
    with open(version_path, "r") as f:
        return f.read().strip()

VERSION = get_version()
config = configparser.ConfigParser()
user_config_path = os.path.expanduser("~/.config/hyprhide/config.cfg")
# default_config_path = "/usr/share/hyprhide/config.cfg"

if os.path.exists(user_config_path):
    config.read(user_config_path)
else:
    with open(user_config_path,"w") as f:
        # contents_to_write = "[DEV]\bdevmode"
        print("Done")
    config.read(user_config_path)
    config.set("DEV","devmode",False)

def main():
    IS_DEV_MODE = config.getboolean("DEV", "devmode", fallback=True)
    run_file = config.get("DEV","hyprhide_src",fallback=None)
    if(IS_DEV_MODE == True and run_file != None):
        
        # if(run_file == None):
        #     #Throw error
        #     pass
        run_file_true = os.path.expanduser(run_file)
        os.system(f"python {run_file_true} --launched --set-version {VERSION}-DEV")
    else:
        os.system(f"hyprhide-gui-main --luanched --set-version {VERSION}")

if __name__ == "__main__":
   
    parser = argparse.ArgumentParser(description="HyprHide Application")
    parser.add_argument("--reset", action="store_true", help="Reset initial setup")

    args = parser.parse_args()
    if args.reset:
         os.system(f"hyprhide-gui-main --luanched --set-version {VERSION}")
    else:
        main()