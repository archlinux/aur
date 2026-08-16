# Maintainer: taxin <unknownbrofrombd@duck.com>
pkgname=bclone
pkgver=1.75.2
pkgrel=1
pkgdesc="rclone with Alist, Alldebrid, iCloud Photos, Teldrive, Terabox, Tmpfs, and unofficial Google Photos (gotohp) support"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/BenjiThatFoxGuy/bclone"
license=('MIT')
depends=('glibc')
optdepends=('fuse3: for rclone mount')
provides=('rclone')
conflicts=('rclone' 'bclone-bin' 'bclone-git')
options=('!strip')

source_x86_64=("rclone-v${pkgver}-linux-amd64.zip::https://github.com/BenjiThatFoxGuy/bclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-amd64.zip")
source_aarch64=("rclone-v${pkgver}-linux-arm64.zip::https://github.com/BenjiThatFoxGuy/bclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm64.zip")
source_armv7h=("rclone-v${pkgver}-linux-arm-v7.zip::https://github.com/BenjiThatFoxGuy/bclone/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm-v7.zip")

sha256sums_x86_64=('52f426f6a2411291b9fdc9894e18bb01193762ead9fd20d55c05e2a691cbae32')
sha256sums_aarch64=('d5e41aac1ac6a8906adc5da681e0435a6e106a964008185da316ba0bf200c9c8')
sha256sums_armv7h=('40000b10f7703767f10508d35670b2c1f0a9d09774e483b2b9c557d43772f76f')

package() {
    local zip_file
    case "${CARCH}" in
        x86_64)    zip_file="rclone-v${pkgver}-linux-amd64.zip" ;;
        aarch64)   zip_file="rclone-v${pkgver}-linux-arm64.zip" ;;
        armv7h)    zip_file="rclone-v${pkgver}-linux-arm-v7.zip" ;;
    esac

    cd "${srcdir}"

    # Extract rclone binary + man page from the release zip using python3 zipfile
    python3 -c "
import zipfile, sys, os, shutil
zip_path = sys.argv[1]
out_dir = sys.argv[2]
with zipfile.ZipFile(zip_path) as z:
    for name in z.namelist():
        base = os.path.basename(name)
        # Skip directories
        if name.endswith('/') or not base:
            continue
        z.extract(name, out_dir)
        extracted = os.path.join(out_dir, name)
        # Flatten: move to out_dir if nested in a subfolder
        if name != base:
            dest = os.path.join(out_dir, base)
            if os.path.exists(dest):
                os.remove(dest)
            shutil.move(extracted, dest)
" "${zip_file}" "."

    install -Dm755 "${srcdir}/rclone"          "${pkgdir}/usr/bin/rclone"
    install -Dm644 "${srcdir}/rclone.1"        "${pkgdir}/usr/share/man/man1/rclone.1"

    # License: MIT — include a minimal note since the release zip doesn't ship COPYING
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License

Copyright (c) Benji That Fox Guy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
