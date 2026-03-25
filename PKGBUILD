pkgname=larp-fetch-git
pkgver=r4.a3c058a
pkgrel=1
pkgdesc="Neofetch-adjacent Python CLI powered by fastfetch with selectable ASCII logos"
arch=('any')
url='https://github.com/LARPMASTERR/LarpFetch'
license=('custom')
depends=('python' 'fastfetch')
makedepends=('git')
provides=('larp-fetch')
conflicts=('larp-fetch')
source=('git+https://github.com/LARPMASTERR/LarpFetch.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/LarpFetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/LarpFetch"

  install -Dm755 larpfetch.py "$pkgdir/usr/lib/larp-fetch/larpfetch.py"
  install -Dm644 detector.py "$pkgdir/usr/lib/larp-fetch/detector.py"

  for f in arch.py ubuntu.py mint.py fedora.py gentoo.py popos.py steamos.py windows.py macos.py cachyos.py; do
    install -Dm644 "$f" "$pkgdir/usr/lib/larp-fetch/$f"
  done

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/larpfetch" <<'WRAP'
#!/usr/bin/env bash
exec /usr/bin/python /usr/lib/larp-fetch/larpfetch.py "$@"
WRAP
}
