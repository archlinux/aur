# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=patch-asar
pkgver=0.5.5

# The upstream author doesn’t tag Git commits for their npm releases.
# We identify the Git commit corresponding to the version by comparing
# its tree object to the code in the npm package file.
# See also: https://www.npmjs.com/package/patch-asar
_commit=e69bb6339d444d723d7ed3ee79e439adf4778e30

pkgrel=2
pkgdesc='Patch .asar archives more easily'
arch=('any')
url='https://github.com/L1lith/Patch-Asar'
license=('MIT') # source: https://www.npmjs.com/package/patch-asar
depends=('nodejs')
makedepends=('jq' 'moreutils' 'npm')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/L1lith/Patch-Asar/archive/${_commit}.tar.gz"
  'executable-shim.js'
  'upstream-license.txt'
)

sha512sums=(
  '4cdf385422f611383da2259129daa11ff90dacfdb96d5c489a43c41a4f3fb66924faacf34fa2c11021570251109a1e666d73b991b53060a1ae2a08744ad59114'
  '042493dbdd31f339a9c6f07305d6bb433baa830004c9add0989c887bf210f1a27e89cf6ebdf5def26c1c4672b141ee1cf1c694257470264dff42ecca03ac0628'
  '5f57972b7ef5e0b9214260af2b0a40bcd9e565340cbc57140bce5f102ad988d2004935102d1f2d239b3fec32decb158b0e01ef207f75476a4125caccb4d6d716'
)

prepare() {
  echo >&2 'Patching package.json'
  jq '.bin = ("./bin/" + .name)' \
    "${srcdir}/Patch-Asar-${_commit}/package.json" \
    | sponge "${srcdir}/Patch-Asar-${_commit}/package.json"

  echo >&2 'Copying the executable shim'
  install -D -m 644 -T \
    "${srcdir}/executable-shim.js" \
    "${srcdir}/Patch-Asar-${_commit}/bin/${pkgname}"
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -T "${srcdir}/upstream-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" \

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/Patch-Asar-${_commit}/README.md"

  echo >&2 'Building'
  cd "${srcdir}/Patch-Asar-${_commit}"
  /usr/bin/npm install -g --install-links --prefix "${pkgdir}/usr"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
