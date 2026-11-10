# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-vserial-git
pkgver=r1.a05fa94
pkgrel=1
epoch=
pkgdesc="Professional Linux Virtual Serial Port & Silicon Hardware UART Emulator Suite with Dedicated Protocol Sniffers and PulseView/Sigrok Logic Analyzer Bridge"
arch=('any')
url="https://github.com/fbetancourt-dev/vserial"
license=('MIT')
groups=()
_pydeps=(
    gobject
    pyserial
)
depends=(
    glib2
    gtk3
    hicolor-icon-theme
    libayatana-appindicator
    pyside6
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=()
optdepends=(
    'pulseview: A Qt based logic analyzer GUI for sigrok'
)
provides=(${pkgname%-git} vserial)
conflicts=(${pkgname%-git} vserial)
replaces=()
backup=()
options=(!debug)
# install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare(){
    git -C "${srcdir}/${pkgname}" clean -dfx

    cd "${srcdir}/${pkgname}"
    python - <<'PY'
import re, pathlib
p = pathlib.Path('vserial/frontend/indicator.py')
s = p.read_text(encoding='utf-8')

s = re.sub(r'^ICON_ACTIVE\s*=.*$', "ICON_ACTIVE = 'vserial-active'", s, flags=re.M)
s = re.sub(r'^ICON_IDLE\s*=.*$',   "ICON_IDLE = 'vserial-idle'",   s, flags=re.M)

s = re.sub(r'^GUI_PATH\s*=.*$',    "GUI_CMD = ['vserial-gui']",     s, flags=re.M)

s = re.sub(r'subprocess\.Popen\(\s*\[\s*sys\.executable\s*,\s*GUI_PATH\s*\]',
           'subprocess.Popen(GUI_CMD', s)
s = re.sub(r'subprocess\.Popen\(\s*\[\s*["\']python3?["\']\s*,\s*GUI_PATH\s*\]',
           'subprocess.Popen(GUI_CMD', s)
s = re.sub(r'os\.system\([^)]*GUI_PATH[^)]*\)',
           'subprocess.Popen(GUI_CMD)', s)

p.write_text(s, encoding='utf-8')
PY
    sed -i -E "s|['\"]/usr/(local/)?bin/pulseview['\"]|'pulseview'|g" \
        vserial/logic/pulseview_bridge.py \
        vserial/logic/vcd_generator.py
    
    local f
    while IFS= read -r -d '' f; do
    sed -i -E '/^Environment=PATH=[^ ]*\.local\/bin/d' "$f"
    sed -i -E \
        -e 's|%h/\.local/bin/||g' \
        -e 's|\$HOME/\.local/bin/||g' \
        -e 's|/home/[^/]+/\.local/bin/||g' \
        "$f"
    done < <(find vserial/daemons/systemd -type f -name '*.service' -print0)
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}"
    python3 -m unittest discover -s tests -p "test_*.py" -v
}
package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 vserial/daemons/systemd/*.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vDm0644 icons/vserial.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
    install -vDm0644 icons/vserial-active.png -t ${pkgdir}/usr/share/icons/hicolor/48x48/apps/
    install -vDm0644 icons/vserial-idle.png -t ${pkgdir}/usr/share/icons/hicolor/48x48/apps/

    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -rv docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    local -a _id=(
        gui
        sniffer-port
        sniffer-bus
        vcd
        indicator 
    )
    local -a _name=(
        'vSerial Manager'
        'vSerial Sniffer (Port /tmp/ttyV0)'
        'vSerial Sniffer (Global Bus)'
        'vSerial VCD / PulseView'
        'vSerial Tray Indicator'
    )
    local -a _comment=(
        'Virtual serial port manager with silicon UART emulation'
        'Protocol sniffer for a dedicated virtual port'
        'Protocol sniffer for the global vSerial bus'
        'Export UART waveform to VCD and open PulseView'
        'System tray indicator for vSerial'
    )
    local -a _exec=(
        'vserial-gui'
        'vserial-sniffer /tmp/ttyV0'
        'vserial-sniffer'
        'vserial-vcd'
        'vserial-indicator'
    )

    for i in "${!_id[@]}"; do
    install -vDm0644 /dev/stdin "${pkgdir}/usr/share/applications/vserial-${_id[$i]}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=${_name[$i]}
Comment=${_comment[$i]}
Exec=${_exec[$i]}
Icon=vserial
Categories=Development;
Terminal=false
StartupNotify=true
MimeType=application/x-executable;
EOF
    done
}
