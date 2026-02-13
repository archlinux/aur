# Maintainer:	      EndlessEden <endlesseden@users.noreply.github.com>
#Original Maintainer: Xyne <gro xunilhcra enyx, backwards>
#Notes: The reason this exists, is because the original upstream maintainer(xyne) is inactive/MIA and the original sources are of high risk now.
#Notes: This mirror exists for code safety and future prosperity of code improvements.
_pkgname=powerpill
pkgname=powerpill-me
pkgver=2021.11
pkgrel=18
pkgdesc='Pacman wrapper for faster downloads.(mirrored)'
arch=(any)
license=(GPL)
original_url="https://xyne.dev/projects/powerpill"
url="https://github.com/EndlessEden/powerpill"
provides=("${pkgname}"
	  "${_pkgname}")

# Dynamic Python Versioning (Major.Minor)
# Capture the current version (e.g., 3.12) to lock this build to it.
_py_majmin=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
_py_next_minor=$(python -c 'import sys; print(sys.version_info[1] + 1)')
_py_major=$(python -c 'import sys; print(sys.version_info[0])')

depends=(
  # Strict Range: Allows 3.14.2, 3.14.9, but FAILS on 3.15.0
  "python>=${_py_majmin}"
  "python<${_py_major}.${_py_next_minor}"
  "pm2ml>2012.12.12"
  "pyalpm"
  "python3-xcgf"
  "python3-xcpf"
  "aria2"
)

makedepends=(python-setuptools)
optdepends=(
  'python3-threaded_servers: internal Pacserve support'
  'reflector: Reflector and Rsync support'
  'rsync: Rsync download support'
)
backup=(etc/powerpill/powerpill.json)

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/EndlessEden/powerpill/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('24855dfd57469b09e50c67451e8638b9c0b5e762b17ae4464ef94a08ab1defa39f80df8b27a7c0e65347797936fa565516d41134d5b1b6c4ae24ed5bfe49f1a0')

package () {
  cd "$srcdir/${_pkgname}-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 'powerpill.json' "$pkgdir/etc/powerpill/powerpill.json"
  install -Dm644 'man/powerpill.json.1.gz' "$pkgdir/usr/share/man/man1/powerpill.json.1.gz"
  install -Dm644 'powerpill-bash-completion.sh' "$pkgdir/usr/share/bash-completion/completions/powerpill"
  install -Dm644 '_powerpill.zsh' "$pkgdir/usr/share/zsh/site-functions/_powerpill"
}

# vim: set ts=2 sw=2 et:
