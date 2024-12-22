# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Contributor: Eric Anderson <ejona86@gmail.com>

pkgname=python-cliapp-fiw
_gitpkgname="${pkgname%-fiw}"
pkgver=1.20180812.1
pkgrel=5
pkgdesc='Python framework for Unix-like command line programs'
arch=('any')
url='https://blog.liw.fi/posts/cliapp/'
license=('GPL-2.0-or-later')
depends=('python' 'python-yaml')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-pyxdg: to honor XDG_CONFIG_HOME for configuration files'
)
conflicts=('python-cliapp') # unrelated package
options=('!debug' '!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.xz::http://deb.debian.org/debian/pool/main/p/python-cliapp/python-cliapp_${pkgver}.orig.tar.xz"
  'python-3.12-compat.patch'
)

sha512sums=(
  '63f2a31588f6c53d278af876dfc368737797105983da715a7196fe4629bc1b8e87bdc44ee2a6eb0e28117719477a754081852ad74dfcab5d8f2ea8e0e7853a8d'
  '606851b6a8c21627aa253facd087e416d07513f424ef01a0519702b55b050784aa4cb3cbd55e1cca4231af255001b18b6b3e8850b688e9b3f32f6835b7de0316'
)

prepare() {
  echo 'global-exclude *_tests.py' > MANIFEST.in
  patch -p1 < python-3.12-compat.patch
}

build() {
  # Build wheel from sdist so it honors MANIFEST.in, which prevents
  # tests from ending up inside the wheel
  python -m build --no-isolation
}

check() {
  python -m unittest cliapp/*_tests.py
}

package() {
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" example*.py

  echo >&2 'Packaging the license'
  install -D -m 644 COPYING \
    "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING

  echo >&2 'Packaging the README'
  install -D -m 644 README \
    "${pkgdir}"/usr/share/doc/${pkgname}/README
}
