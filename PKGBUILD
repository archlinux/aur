# Maintainer:
# Contributor: Minmo <com dot gmail at maroboromike>
# Contributor: Sematre <sematre at gmx dot de>

pkgname="yt-dlp-drop-in"
pkgver=2025.06.30
pkgrel=1
pkgdesc='Provide both youtube-dl command and python imports using yt-dlp'
url="https://aur.archlinux.org/packages/yt-dlp-drop-in"
arch=('any')
license=('Unlicense')

depends=('python')

provides=("youtube-dl=${pkgver:?}")
conflicts=("youtube-dl")

pkgver() {
  LC_ALL=C pacman -Si yt-dlp | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])'
}

package() {
  depends+=('yt-dlp')

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/youtube-dl" << END
#!/usr/bin/env python

import sys
import yt_dlp

if __name__ == '__main__':
    yt_dlp.main(['--compat-options', 'youtube-dl'] + sys.argv[1:])
END

  local _sitepackages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dm755 "$pkgdir/${_sitepackages:?}"
  ln -sfT "yt_dlp" "$pkgdir/$_sitepackages/youtube_dl"
}
