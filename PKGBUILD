# Maintainer: 00ein00
pkgname=nicotine-plus-cigorette-git
pkgver=r12218.caf9e10
pkgrel=1
pkgdesc="Nicotine+ Soulseek client patched for Tor anonymity via Cigorette"
arch=('any')
url="https://gitlab.com/lilacashes/nicotine-over-tor"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3' 'gobject-introspection' 'tor' 'torsocks')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('nicotine-plus')
conflicts=('nicotine-plus' 'nicotine-plus-git')
source=("git+https://github.com/nicotine-plus/nicotine-plus.git"
  "git+https://gitlab.com/lilacashes/nicotine-over-tor.git")
sha256sums=('SKIP'
            'SKIP')
install='nicotine-plus-cigorette-git.install'

prepare() {
  cd "${srcdir}/nicotine-plus"
  git checkout "$(git tag --sort=-version:refname | head -n1)"

  # Apply all patches from Cigorette
  for p in "${srcdir}"/nicotine-over-tor/*.patch "${srcdir}"/nicotine-over-tor/*.diff; do
    if [ -f "$p" ]; then
      patch -p1 -i "$p" || echo "Warning: Patch $p failed to apply cleanly"
    fi
  done
}

build() {
  cd "${srcdir}/nicotine-plus"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/nicotine-plus"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Install the Cigorette wrapper script if it exists
  if [ -f "${srcdir}/nicotine-over-tor/nicotine-tor.sh" ]; then
    install -Dm755 "${srcdir}/nicotine-over-tor/nicotine-tor.sh" "${pkgdir}/usr/bin/nicotine-tor"
  fi

  # Replace upstream desktop file and install patched one to launch 'nicotine-tor' instead of 'nicotine'
  rm -f "${pkgdir}/usr/share/applications/org.nicotine_plus.Nicotine.desktop"
  install -Dm644 "${srcdir}/org.nicotine_plus.Nicotine.desktop" "${pkgdir}/usr/share/applications/org.nicotine_plus.Nicotine.desktop"
}
