# Maintainer: Max Hefley <Mizuna737@gmail.com>

pkgname=gesturecontrol
pkgver=r1.0
pkgrel=2
pkgdesc="Hand gesture recognition: webcam → MediaPipe → D-Bus signals → configurable actions"
arch=('any')
url="https://github.com/Mizuna737/gesturecontrol"
license=('MIT')
install=gesturecontrol.install

depends=(
    'python>=3.11'
    'python-dbus'       # must be a system package; not installable cleanly via pip into a venv
    'python-gobject'    # GTK, GLib, WebKit2 via GObject introspection
    'gtk3'
    'webkit2gtk'        # embedded config UI window (WebKit2 4.1)
    'curl'              # first-run setup downloads the MediaPipe hand landmarker model
)

optdepends=(
    'xdotool: key action support in actions.toml'
    'libnotify: desktop notifications for gesture sequence progress'
    'playerctl: media control actions'
)

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() { :; }

package() {
    cd "$srcdir/$pkgname"

    # ── Python scripts ──────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/$pkgname"
    install -m644  gestureControl.py         "$pkgdir/usr/share/$pkgname/"
    install -m644  gestureControl-config.py  "$pkgdir/usr/share/$pkgname/"
    install -m644  gestureControl-actions.py "$pkgdir/usr/share/$pkgname/"
    install -m644  gestureControl-tray.py    "$pkgdir/usr/share/$pkgname/"

    # ── Config UI ───────────────────────────────────────────────────────────────
    # Flask serves this directly; scripts find it via Path(__file__).parent
    install -dm755 "$pkgdir/usr/share/$pkgname/gestureControl-config-ui"
    install -m644  gestureControl-config-ui/{index.html,app.js,style.css} \
        "$pkgdir/usr/share/$pkgname/gestureControl-config-ui/"

    # ── Executable wrappers ─────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/bin"
    for script in gestureControl gestureControl-config gestureControl-actions gestureControl-tray; do
        wrapper="$pkgdir/usr/bin/${script,,}"
        printf '#!/bin/sh\nexec python3 /usr/share/%s/%s.py "$@"\n' "$pkgname" "$script" > "$wrapper"
        chmod 755 "$wrapper"
    done

    # ── First-run setup command ─────────────────────────────────────────────────
    install -Dm755 gesturecontrol-setup.sh "$pkgdir/usr/bin/gesturecontrol-setup"

    # ── Systemd user units ──────────────────────────────────────────────────────
    install -Dm644 systemd/gesturecontrol.service \
        "$pkgdir/usr/lib/systemd/user/gestureControl.service"
    install -Dm644 systemd/gesturecontrol-actions.service \
        "$pkgdir/usr/lib/systemd/user/gestureControl-actions.service"

    # ── App launcher entry ──────────────────────────────────────────────────────
    install -Dm644 gesturecontrol.desktop \
        "$pkgdir/usr/share/applications/gesturecontrol.desktop"

    # ── XDG autostart (tray icon on every login) ────────────────────────────────
    install -Dm644 gesturecontrol-autostart.desktop \
        "$pkgdir/etc/xdg/autostart/mizuna-gesturecontrol-tray.desktop"

    # ── Example configs ─────────────────────────────────────────────────────────
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644  config/triggers.toml.example "$pkgdir/usr/share/doc/$pkgname/"
    install -m644  config/actions.toml.example  "$pkgdir/usr/share/doc/$pkgname/"
}
