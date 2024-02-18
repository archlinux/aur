# Maintainer:
# Contributor: Minmo <com dot gmail at maroboromike>
# Contributor: Sematre <sematre at gmx dot de>

pkgname=yt-dlp-drop-in
pkgver=2023.12.30
pkgrel=1
pkgdesc='Provide both youtube-dl command and python imports using yt-dlp'
arch=('any')
license=('Unlicense')

makedepends=('python')

provides=("youtube-dl=${pkgver:?}")
conflicts=("youtube-dl")

source=(
  "youtube-dl.py"
  #"youtube-dl.sh"
)
sha256sums=(
  "4b3d042525b05d84bb892a864a3ae832cc923bd630ea7e8b4d91ae9c4ec555db"
  #"f2096dadce18216a3da2634202666713831ba8fb36f1f591e951c7329cc4f002"
)

pkgver() {
  LANG=C LC_ALL=C pacman -Si yt-dlp | grep '^Version' | head -1 | sed -nE 's@^Version\s+: (.*)-.*$@\1@p'
}

package() {
  depends=('yt-dlp')

  install -Dm755 "$srcdir/youtube-dl.py" "$pkgdir/usr/bin/youtube-dl"

  local _sitepackages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dm755 "${pkgdir:?}${_sitepackages:?}"
  ln -sfT "yt_dlp" "${pkgdir:?}${_sitepackages:?}/youtube_dl"
}
