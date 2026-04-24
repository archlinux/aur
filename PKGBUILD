pkgname=legion-gui
pkgver=0.5.2.r0.4a3231e
pkgrel=5
pkgdesc="Legion GUI (Sparta successor), ported from Kali Linux for Arch Linux"
arch=("any")
url="https://gitlab.com/kalilinux/packages/legion"
license=("GPL-3.0-only")
backup=("etc/legion.conf")
depends=("python" "polkit" "nmap" "xterm" "xdg-utils" "python-colorama" "python-pandas" "python-pyfiglet" "python-pyqt6" "python-qasync" "python-requests" "python-rich" "python-service-identity" "python-six" "python-sqlalchemy" "python-termcolor" "python-urllib3" "chromium" "xorg-server-xvfb")
optdepends=("nikto: web server scanning actions" "whatweb: web fingerprinting actions" "smtp-user-enum-git: SMTP enumeration actions")
makedepends=("git" "patch" "perl" "python-pip")
source=("git+https://gitlab.com/kalilinux/packages/legion.git#branch=kali/master" "eyewitness::git+https://github.com/RedSiege/EyeWitness.git#branch=master" "legion-gui.desktop" "legion-gui-launcher")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

prepare() {
  cd "$srcdir/legion"

  patch -Np1 -i debian/patches/use-python3-shebang.patch
  patch -Np1 -i debian/patches/fix-paths.patch
  patch -Np1 -i debian/patches/Remove-rwho-usage.patch
  patch -Np1 -i debian/patches/Fix-sqlalchemy.exc.ArgumentError.patch
  patch -Np1 -i debian/patches/fix-pyexploitdb-import.patch
  patch -Np1 -i debian/patches/fix-typo-in-ssh-user-list.patch

  sed -i "s|^texteditor-path=.*|texteditor-path=/usr/bin/xdg-open|" legion.conf
  sed -i "s|smtp-user-enum -M|smtp-user-enum.pl -M|" legion.conf
  grep -q '^nikto="http,https,ssl,soap,http-proxy,http-alt,https-alt", tcp$' legion.conf || sed -i '/^screenshooter="http,https,ssl,http-proxy,http-alt,https-alt", tcp$/a nikto="http,https,ssl,soap,http-proxy,http-alt,https-alt", tcp' legion.conf

  python - <<'PY'
from pathlib import Path

p = Path("scripts/python/pyShodan.py")
s = p.read_text()
s = s.replace(
    """from pyShodan import PyShodan
""",
    """try:
    from pyShodan import PyShodan
except ImportError:
    PyShodan = None
""",
    1,
)
s = s.replace(
    """        try:
            pyShodanObj = PyShodan()
""",
    """        try:
            if PyShodan is None:
                print("pyShodan module not installed.")
                return {}
            pyShodanObj = PyShodan()
""",
    1,
)
p.write_text(s)
PY

  python - <<'PY'
from pathlib import Path

p = Path("app/Screenshooter.py")
s = p.read_text()

old = """        if isKali():
            eyewitness_path = "/usr/bin/eyewitness"
        else:
            eyewitness_path = "/usr/local/bin/eyewitness"
"""
new = """        if os.path.isfile("/usr/bin/eyewitness"):
            eyewitness_path = "/usr/bin/eyewitness"
        else:
            eyewitness_path = "/usr/local/bin/eyewitness"
"""
if old in s:
    s = s.replace(old, new, 1)

legacy_err = '                raise FileNotFoundError("EyeWitness not found at /usr/bin/eyewitness. Please install it.")'
new_err = '                raise FileNotFoundError(f"EyeWitness not found at {eyewitness_path}. Please install it.")'
if legacy_err in s:
    s = s.replace(legacy_err, new_err, 1)

p.write_text(s)
PY
}

build() {
  cd "$srcdir/eyewitness"
  python -m venv eyewitness-venv
  eyewitness-venv/bin/pip install -U pip wheel setuptools
  eyewitness-venv/bin/pip install -r setup/requirements.txt
}

package() {
  cd "$srcdir/legion"

  install -d "$pkgdir/usr/share/legion"
  cp -a app controller db images parsers scripts ui utilities wordlists "$pkgdir/usr/share/legion/"
  install -m644 CHANGELOG.txt "$pkgdir/usr/share/legion/CHANGELOG.txt"
  install -m644 LICENSE "$pkgdir/usr/share/legion/LICENSE"
  install -m644 legion.py "$pkgdir/usr/share/legion/legion.py"
  install -m644 nmap.xsl "$pkgdir/usr/share/legion/nmap.xsl"

  install -Dm644 legion.conf "$pkgdir/etc/legion.conf"
  ln -sf /etc/legion.conf "$pkgdir/usr/share/legion/legion.conf"

  install -Dm755 "$srcdir/legion-gui-launcher" "$pkgdir/usr/bin/legion-gui"
  install -Dm644 "$srcdir/legion-gui.desktop" "$pkgdir/usr/share/applications/legion-gui.desktop"
  install -Dm644 images/icons/Legion-N_128x128.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/legion-gui.svg"

  install -d "$pkgdir/usr/share/legion/eyewitness"
  cp -a "$srcdir/eyewitness/Python" "$pkgdir/usr/share/legion/eyewitness/"
  cp -a "$srcdir/eyewitness/setup" "$pkgdir/usr/share/legion/eyewitness/"
  cp -a "$srcdir/eyewitness/eyewitness-venv" "$pkgdir/usr/share/legion/eyewitness/"
  if test -f "$srcdir/eyewitness/LICENSE"; then
    install -m644 "$srcdir/eyewitness/LICENSE" "$pkgdir/usr/share/legion/eyewitness/LICENSE"
  fi
  if test -f "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/pyvenv.cfg"; then
    sed -i "s|$srcdir/eyewitness|/usr/share/legion/eyewitness|g" "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/pyvenv.cfg" 2>/dev/null || true
  fi
  find "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/bin" -maxdepth 1 -type f ! -name "python" ! -name "python3" ! -name "python3.*" -delete 2>/dev/null || true
  find "$pkgdir/usr/share/legion/eyewitness/eyewitness-venv/bin" -maxdepth 1 -type l -name "*thon" ! -name "python" ! -name "python3*" -delete 2>/dev/null || true

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/eyewitness" <<'WRAP'
#!/usr/bin/env bash
set -euo pipefail
cd /usr/share/legion/eyewitness
export PATH="/usr/share/legion/eyewitness/eyewitness-venv/bin:$PATH"
exec /usr/share/legion/eyewitness/eyewitness-venv/bin/python /usr/share/legion/eyewitness/Python/EyeWitness.py "$@"
WRAP
  chmod 755 "$pkgdir/usr/bin/eyewitness"

  chmod 755 "$pkgdir/usr/share/legion/scripts/"* 2>/dev/null || true
  find "$pkgdir/usr/share/legion" -type d -name "__pycache__" -prune -exec rm -rf {} + 2>/dev/null || true
  find "$pkgdir/usr/share/legion" -type f -name "*.pyc" -delete 2>/dev/null || true
}
