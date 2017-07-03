# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seahub
pkgver=6.1.1
pkgrel=1
pkgdesc="The web end of seafile server"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=("seafile-server" "python2-virtualenv")
makedepends=('python2-pip')
source=("${pkgname}-${pkgver}-server.tar.gz::${url}/archive/v${pkgver}-server.tar.gz"
        "seahub-preupgrade")
sha256sums=('988f2fea7ac3ad9e3537dcdadd96c55edf5bb6bfaee3ada42190386c9dea10bf'
            'd3b0d33848ab9e0dbb9ea6e6e385fc4ffa82a77193af447edef7646d68e396b1')
# Strip is not happy on precompiled libs in virtualenv, temporary disable
options=("!strip")

prepare () {
  cd "${srcdir}/${pkgname}-${pkgver}-server"

  # Fix all script's python 2 requirement
  grep -s -l -r '#!/usr/bin/env python\b' "${srcdir}/${pkgname}-${pkgver}-server" \
    | xargs sed -i -e '1 s|env python\b|env python2|'
}

package() {
  # Install seahub
  install -dm755 "${pkgdir}/usr/share/seafile-server/seahub"
  cp -r -p "${srcdir}/seahub-${pkgver}-server/"* \
    "${pkgdir}/usr/share/seafile-server/seahub/"

  # Install seahub preupgrade script
  install -D -m755 "${srcdir}/seahub-preupgrade" \
    "${pkgdir}/usr/bin/seahub-preupgrade"

  # Create private virtualenv
  virtualenv2 --system-site-packages "${pkgdir}/usr/lib/seafile/seafileenv"
  source "${pkgdir}/usr/lib/seafile/seafileenv/bin/activate"
  pip2 --isolated install --no-compile \
    -r "${srcdir}/${pkgname}-${pkgver}-server/requirements.txt"
  pip2 --isolated install --no-compile \
    gunicorn
  deactivate
  virtualenv2 --relocatable "${pkgdir}/usr/lib/seafile/seafileenv"

  # Recompile all .pyc files in virtualenv.
  # Not stricly required, but useful for printing valid source file paths in case of python exceptions.
  # One caveat: requires minimum 1GB RAM, comment next two commands in case of < 1GB RAM
  # _gaiohttp.py excluded due to https://github.com/benoitc/gunicorn/issues/810
  python2 -m compileall -q -f -d /usr/lib/seafile/seafileenv/bin \
        -- "${pkgdir}/usr/lib/seafile/seafileenv/bin"
  python2 -m compileall -q -f -d /usr/lib/seafile/seafileenv/lib/python2.7 \
        -x '.*/gunicorn/workers/_gaiohttp.py' \
        -- "${pkgdir}/usr/lib/seafile/seafileenv/lib/python2.7"

  # Fix virtualenv paths
  sed -i "s#${pkgdir}##" "${pkgdir}"/usr/lib/seafile/seafileenv/bin/activate*
}
