# Maintainer: Peter Rice <{first name}@peterrice.xyz>

pkgname=qbpm-git
pkgver=2.0.rc1.r4
pkgrel=1
pkgdesc="A profile manager for qutebrowser"
url="https://github.com/pvsr/qbpm"
license=('GPL-3.0-or-later')
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python-click' 'python-xdg-base-dirs' 'python-dacite')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-flit-core' 'scdoc')
provides=('qbpm')
source=("git+https://github.com/pvsr/qbpm")

pkgver() {
  cd qbpm
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/qbpm" clean -dfx
}

build() {
  cd qbpm
  python -m build --wheel --no-isolation
}

package() {
  cd qbpm
  install -D -m644 completions/qbpm.fish ${pkgdir}/usr/share/fish/vendor_completions.d/qbpm.fish
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/qbpm/LICENSE

  scdoc < qbpm.1.scd > qbpm.1
  install -D -m644 qbpm.1 ${pkgdir}/usr/share/man/man1/qbpm.1

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/"{bash-completion/completions,zsh/site-functions}
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH=${pkgdir}/${site_packages} _QBPM_COMPLETE=bash_source ${pkgdir}/usr/bin/qbpm > ${pkgdir}/usr/share/bash-completion/completions/qbpm
  PYTHONPATH=${pkgdir}/${site_packages} _QBPM_COMPLETE=zsh_source  ${pkgdir}/usr/bin/qbpm > ${pkgdir}/usr/share/zsh/site-functions/_qbpm
}
