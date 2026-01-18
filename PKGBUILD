# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Maintainer: Mohammad Reza Karmi <m.r.karimi.j@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: eolianoe <eolianoe [at] googlemail [dot] com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Étienne Deparis <etienne [at] depar [dot] is>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>

pkgname=khal-git
_pkgname=khal
pkgver=0.13.1.dev31+g0e76dbc46.d20260118
pkgrel=1
pkgdesc='CLI calendar application build around CalDAV (Git)'
arch=('any')
url="https://lostpackets.de/khal/"
license=('MIT')
depends=(
  python
  python-click
  python-click-log
  python-configobj
  python-dateutil
  python-icalendar
  python-pytz
  python-pyxdg
  python-tzlocal
  python-urwid
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-sphinx
  python-wheel
)
checkdepends=(
  python-pytest
  python-freezegun
  python-hypothesis
  python-packaging
  vdirsyncer
)
optdepends=(
  'gawk: for mutt2khal'
  'python-setproctitle: to set process name'
  'vdirsyncer: to synchronize CalDAV calendars'
)
source=("${_pkgname}::git+https://github.com/pimutils/khal.git")
sha256sums=('SKIP')
provides=('khal')
conflicts=('khal')
options=(!emptydirs)

pkgver() {
  cd "$_pkgname"
  python -m setuptools_scm
}

prepare() {
  # avoid makedepends on python-sphinxcontrib-newsfeed
  # (we build only the man page, not HTML docs)
  sed -i "s|'sphinxcontrib.newsfeed',||" $_pkgname/doc/source/conf.py
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --skip-dependency-check --no-isolation
  make -C doc man PYTHONPATH="${PWD}"
}

check() {
  cd "${_pkgname}"
  LC_ALL=C PYTHONPATH=build pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  # executables
  install -vDm 755 bin/{i,}$_pkgname misc/mutt2khal -t "$pkgdir"/usr/bin/
  # configuration
  install -vDm 644 $_pkgname.conf.sample "$pkgdir"/usr/share/doc/$_pkgname/examples/$_pkgname.conf
  # man page
  install -vDm 644 doc/build/man/$_pkgname.1 -t "$pkgdir"/usr/share/man/man1/
  # completions
  install -vd "$pkgdir"/usr/share/{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" _KHAL_COMPLETE=bash_source "$pkgdir"/usr/bin/khal > "$pkgdir"/usr/share/bash-completion/completions/$_pkgname
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" _KHAL_COMPLETE=fish_source "$pkgdir"/usr/bin/khal > "$pkgdir"/usr/share/fish/vendor_completions.d/$_pkgname.fish
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" _KHAL_COMPLETE=zsh_source "$pkgdir"/usr/bin/khal > "$pkgdir"/usr/share/zsh/site-functions/_$_pkgname
  # desktop file
  install -vDm 644 misc/khal.desktop -t "$pkgdir"/usr/share/applications/
  # docs
  install -vDm 644 {AUTHORS.txt,{CHANGELOG,CONTRIBUTING,README}.rst} -t "$pkgdir"/usr/share/doc/$_pkgname/
  # symlink license file
  install -d "$pkgdir"/usr/share/licenses/$_pkgname
  ln -s "$site_packages"/$_pkgname-$pkgver.dist-info/licenses/doc/source/license.rst "$pkgdir"/usr/share/licenses/$_pkgname/license.rst
}
