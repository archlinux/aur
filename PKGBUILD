# Maintainer: Saeed Badredlden <helwanlinux@gmail.com>
pkgname=hel-sync
pkgver=1.1.0
pkgrel=3
pkgdesc="Official synchronization utility for Helwan Linux - Zero-App philosophy."
arch=('any')
url="https://github.com/helwan-linux/hel-sync"
license=('GPL3')
# الاعتماديات الحقيقية بناءً على الكود المصدري
depends=(
    'python' 
    'python-pyqt5' 
    'python-flask' 
    'python-qrcode' 
    'python-pillow' 
    'python-pyautogui'
    'python-cryptography'
    'python-pyopenssl'
    'xdotool'
    'libxtst'                 # تم التصحيح من libxtest
    'libnotify'
    'libcanberra'             # بديل أفضل وأخف لـ pulseaudio-utils
    'sound-theme-freedesktop'
)
makedepends=('git')
source=("git+https://github.com/helwan-linux/hel-sync.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/hel-sync/sync"

    # 1. إنشاء مجلد واحد في الـ opt (ده اللي بيحل مشاكل المسارات في آرش)
    install -dm755 "$pkgdir/opt/hel-sync"
    cp -r * "$pkgdir/opt/hel-sync/"

    # 2. إنشاء الـ Launcher اللي بيشغل البرنامج من مكانه الجديد
    install -dm755 "$pkgdir/usr/bin"
    cat <<'EOF' > "$pkgdir/usr/bin/hel-sync"
#!/bin/bash
export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority
cd /opt/hel-sync && python main.py "$@"
EOF

    chmod +x "$pkgdir/usr/bin/hel-sync"

    # 3. الأيقونة والـ Desktop Entry
    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 hel-sync.desktop "$pkgdir/usr/share/applications/"
}
