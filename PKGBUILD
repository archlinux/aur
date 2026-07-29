# Maintainer: nyq-dev <adresa_ta_de_email@example.com>
pkgname=nyqfetch
pkgver=1.0.4
pkgrel=1
pkgdesc="A fast, pure Python fetch tool for Arch Linux"
arch=('any')
url="https://archlinux.org"
license=('MIT')
depends=('python')
source=()
sha256sums=()

package() {
    install -d "${pkgdir}/usr/bin"

    cat << 'EOF' > "${pkgdir}/usr/bin/nyqfetch"
#!/usr/bin/env python3
import os
import platform
import getpass
import socket

def get_ram_usage():
    try:
        total = 0
        avail = 0
        with open("/proc/meminfo", "r") as f:
            for line in f:
                if "MemTotal" in line:
                    total = int(line.split()[1]) / 1024 / 1024
                elif "MemAvailable" in line:
                    avail = int(line.split()[1]) / 1024 / 1024
        
        if total == 0:
            return "Unknown"
            
        used = total - avail
        return f"{used:.2f} GiB / {total:.2f} GiB"
    except:
        return "Unknown"

def get_shell():
    return os.environ.get("SHELL", "").split("/")[-1] or "Unknown"

def get_terminal():
    return os.environ.get("TERM_PROGRAM") or os.environ.get("TERM") or "Unknown"

user = getpass.getuser()
hostname = socket.gethostname()
os_name = "Arch Linux x86_64"
kernel = platform.release()
shell = get_shell()
ram = get_ram_usage()
term = get_terminal().capitalize()

C1 = "\033[36m" # Cyan
RESET = "\033[0m"
BOLD = "\033[1m"

logo_and_info = [
    f" {C1}  /\\          {RESET}{BOLD}{user}{C1}@{RESET}{BOLD}{hostname}{RESET}",
    f" {C1} /  \\         {C1}-------------------------{RESET}",
    f" {C1}/\\   \\        {C1}OS: {RESET}{os_name}",
    f" {C1}/      \\       {C1}Kernel: {RESET}{kernel}",
    f" {C1}/   _    \\      {C1}Shell: {RESET}{shell}",
    f" {C1}/   _     _\\     {C1}Memory: {RESET}{ram}",
    f" {C1}/_  /  _  /  \\_   {C1}Terminal: {RESET}{term} (nyqfetch)",
    f" {C1}/_ _/  /_ _/  /__{RESET}"
]

print("\n" + "\n".join(logo_and_info) + "\n")
EOF

    chmod +x "${pkgdir}/usr/bin/nyqfetch"
}
