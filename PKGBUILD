# Maintainer: nyq-dev <adresa_ta_de_email@example.com>
pkgname=nyqfetch
pkgver=1.0.7
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

    cat << 'OUTER_EOF' > "${pkgdir}/usr/bin/nyqfetch"
#!/usr/bin/env python3
import os
import platform
import getpass
import socket

def get_ram_usage():
    try:
        t, a = 0, 0
        with open("/proc/meminfo", "r") as f:
            for line in f:
                if "MemTotal" in line:
                    for word in line.split():
                        if word.isdigit():
                            t = int(word) / 1024 / 1024
                elif "MemAvailable" in line:
                    for word in line.split():
                        if word.isdigit():
                            a = int(word) / 1024 / 1024
        if t == 0:
            return "Unknown"
        return f"{t - a:.2f} GiB / {t:.2f} GiB"
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

C1 = "\033[36m"
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
OUTER_EOF

    chmod +x "${pkgdir}/usr/bin/nyqfetch"
}
