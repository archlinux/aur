# Maintainer: Bacem Abidi <abidi.bacem.ab.25@gmail.com>
pkgname=auroradownloader
pkgver=1.0.10
pkgrel=1
pkgdesc="Your all in one web based music manager"
arch=('any')
url="https://github.com/Bacem-Abidi/AuroraDownloader"
license=('GPL3')
depends=(
    'ffmpeg'
    'python'
    'redis'          # required for Server‑Sent Events
    'mpc'
)
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bacem-Abidi/AuroraDownloader/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname-user.service"
        "$pkgname.install")
install="$pkgname.install"
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    local _extracted_dir="AuroraDownloader-$pkgver"

    # 1. Install application files
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$_extracted_dir"/* "$pkgdir/opt/$pkgname/"

    # 2. Create virtual environment (using system Python, with copies)
    cd "$pkgdir/opt/$pkgname"
    /usr/bin/python -m venv --copies venv

    # 3. Install Python dependencies
    ./venv/bin/pip install --no-cache-dir --upgrade pip
    ./venv/bin/pip install --no-cache-dir gunicorn
    ./venv/bin/pip install --no-cache-dir -r requirements.txt

    # 4. Fix shebangs – replace build‑time paths with the final venv path
    find venv/bin -type f -exec sed -i '1s|^#!.*python.*|#!/opt/auroradownloader/venv/bin/python|' {} \;

    # In package() after creating venv:
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname-user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    # 6. Create log directory (ownership will be set in .install)
    install -d "$pkgdir/var/log/$pkgname"
}
