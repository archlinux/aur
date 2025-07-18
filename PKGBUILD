# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

# Upstream PKGBUILD repository: https://github.com/Saurabh825/PKGBUILDs

pkgname=bento4-sdk-bin
_basepkgname=${pkgname%-sdk-bin}
pkgver=1.6.0.641
_pkgverstr=1-6-0-641
pkgrel=1
pkgdesc='A fast, modern, open source C++ toolkit for all your MP4 and DASH/HLS/CMAF media format needs'
arch=('x86_64')
url='https://www.bento4.com/'
license=('GPL')
depends=('glibc')
makedepends=('unzip')
optdepends=('python')
provides=("${_basepkgname}")
conflicts=("${_basepkgname}")
source=("https://www.bok.net/Bento4/binaries/Bento4-SDK-${_pkgverstr}.${CARCH}-unknown-linux.zip")
sha256sums=('d48dc6b164941212e5614237b4d9aeff81d4d111ee8b1508892764078a0870e8')

package() {
  cd "Bento4-SDK-${_pkgverstr}.${CARCH}-unknown-linux"

  # Install all binaries and scripts from the bin directory
  install -Dm755 bin/* -t "$pkgdir/usr/bin/"

  # Rename conflicting binaries (libmp4v2 also installs these)
  for bin in mp4info mp4extract; do
    mv "$pkgdir/usr/bin/$bin" "$pkgdir/usr/bin/${bin}-${_basepkgname}"
  done

  # Patch python scripts to use the correct library path
  for script in mp4dash mp4hls mp4dashclone; do
    # Check if the script exists before patching
    if [[ -f "$pkgdir/usr/bin/$script" ]]; then
      sed -i "s|\$BASEDIR/../utils/|\\\$BASEDIR/../lib/${_basepkgname}/|" "$pkgdir/usr/bin/$script"
    fi
  done

  # Install static library
  install -Dm644 lib/libap4.a "$pkgdir/usr/lib/libap4.a"

  # Install headers
  install -Dm644 include/*.h -t "$pkgdir/usr/include/${_basepkgname}/"

  # Install Python utility scripts
  install -Dm644 utils/*.py -t "$pkgdir/usr/lib/${_basepkgname}/"

  # Install documentation
  local docdir="$pkgdir/usr/share/doc/${_basepkgname}"
  install -d "$docdir"
  for f in docs/*.pdf docs/*.doc docs/*.chm; do
    if [[ -f "$f" ]]; then
      install -Dm644 "$f" "$docdir/"
    fi
  done
  unzip -o docs/Bento4-HTML.zip -d "$docdir"

  # Install license
  install -Dm644 docs/LICENSE.txt "$pkgdir/usr/share/licenses/${_basepkgname}/LICENSE.txt"
}
