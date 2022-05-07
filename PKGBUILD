# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale-venv
_pkgname=funkwhale
pkgver=1.2.5
pkgrel=1
pkgdesc="A community-driven project that lets you listen and share music and audio within a decentralized, open network."
arch=(any)
url="https://funkwhale.audio/"
license=(GPL3)
provides=('funkwhale')
conflicts=('funkwhale')
optdepends=('apache: to use the Apache web server'
            'certbot-apache: for the server to be accessible from outside'
            'mod_xsendfile: needed if Apache server is used'
            'nginx: to use nginx web server')
depends=('curl'
        'file'
        'ffmpeg'
        'libjpeg'
        'libpqxx'
        'libldap'
        'libsasl'
        'postgresql'
        'redis'
        'python'
)
makedepends=(git)
# do not strip for pip wheel libraries
options=(!strip)
_source_api="https://dev.funkwhale.audio/funkwhale/funkwhale/-/jobs/artifacts/${pkgver}/download?job="
_source_env="https://dev.funkwhale.audio/funkwhale/funkwhale/raw/${pkgver}/deploy/"
source=("${_pkgname}-${pkgver}-api.zip::${_source_api}build_api"
        "${_pkgname}-${pkgver}-front.zip::${_source_api}build_front"
        "${_source_env}funkwhale_proxy.conf"
        "${_source_env}nginx.template"
        "funkwhale.service"
        "funkwhale-beat.service"
        "funkwhale-server.service"
        "funkwhale-worker.service"
        "apache-funkwhale.conf"
        "env-template"
        "funkwhale_manage"
)
sha256sums=('8a1ff070b7bd7205fcfebdb2e8f1c92dd1ffb60fb2fe084a2bab36026575059e'
            '82e99ee29d2306cd379a61ae4c2c1d461625b74d24001d51193dafb2f18d9628'
            '2906a075b41dcd2375c601482cb5a00e42cb87c613012b176c570d77918afbf2'
            '37fa894055ce94b2d0752c48a89c04d67a2610a3572a788ba7a3cf65e1641c90'
            '01104122e3df765735b1062aa15e7a73c7949f2d9b7332c0e02e02db66345349'
            '9015716bca869766eca58f7a14eda274d211f189c5d3d7cde741739fe7744fb7'
            'dac163ac314992692f5743fed8b0c3791e36fbb465c1c07e3fc88a51a263410a'
            'efefea0ebd84c99ec17a766519dd3a67ddcae87af453b99fc01f47976f4425e3'
            'f37b1b6257c5b92272f36773041c83fc72276ff4040100fba92db8136cc9177d'
            'cea307055e9f8001a1507c507e1be91352d896cab17260a221f4ab8c298506d8'
            'ff2f7db927720f11eb9a3b698ad12e5a6e0045a315969b5dd6cff2e7d95dca82')
install=${pkgname}.install

prepare() {
  cd "$srcdir"
  ## change path of proxy parameters
  sed 's#/etc/nginx/funkwhale_proxy.conf#/etc/webapps/funkwhale/funkwhale_proxy.conf#' nginx.template > nginx.template.patched
  ## remove http2, as it is not always working
  sed -id 's#443 ssl http2;#443 ssl;#' nginx.template.patched

  ## install python-ldap manually
  sed -id 's/python-ldap/#python-ldap/' api/requirements/base.txt
}

build() {
  cd "$srcdir"
  ## TODO: build front-end from source
}

package() {
  cd "$srcdir"

  install -dm0755 -o root "$pkgdir"/usr/share/webapps/${_pkgname}

  # install api and frontend
  cp -R api "$pkgdir"/usr/share/webapps/${_pkgname}/.
  cp -R front "$pkgdir"/usr/share/webapps/${_pkgname}/.
  chmod 755 -R "$pkgdir"/usr/share/webapps/${_pkgname}/api/
  chown root:http -R "$pkgdir"/usr/share/webapps/${_pkgname}/api/
  mkdir "$pkgdir"/usr/bin
  install -Dm755 funkwhale_manage "$pkgdir"/usr/bin/funkwhale_manage

  # create virtualenv and install python dependencies
  export PIP_DISABLE_PIP_VERSION_CHECK=1
  export PYTHONDONTWRITEBYTECODE=1
  python -m venv "$pkgdir"/usr/share/webapps/funkwhale/virtualenv
  source "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/bin/activate

  pip install wheel
   
  # bug with python-ldap from pip, missing libldap_r.so
  ln -s /usr/lib/libldap.so "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/lib/libldap_r.so
  args="-L$pkgdir/usr/share/webapps/funkwhale/virtualenv/lib/"
  CFLAGS="${args}" \
    CPPFLAGS="${args}" \
    LDFLAGS="${args}" \
    pip install python-ldap
  pip install -r api/requirements.txt


  # Remove pkgdir references in scripts
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/bin/ \
    -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/ \
    -type f -name "*.py[co]" -delete
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/ \
    -type d -name "__pycache__" -delete

  deactivate
  # deactivate virtualenv

  # install server config
  install -d "$pkgdir"/etc/webapps/${_pkgname}/config
  install -Dm644 funkwhale_proxy.conf "$pkgdir"/etc/webapps/${_pkgname}/.
  install -Dm644 nginx.template.patched "$pkgdir"/etc/webapps/${_pkgname}/nginx.template
  install -Dm644 apache-funkwhale.conf "$pkgdir"/etc/webapps/${_pkgname}/.
  install -Dm644 env-template "$pkgdir"/etc/webapps/${_pkgname}/env.template

  install -Dm644 funkwhale{,-beat,-worker,-server}.service -t "$pkgdir/usr/lib/systemd/system/"

  echo -e 'u funkwhale - "Funkwhale music server" /srv/funkwhale\nm funkwhale http' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'd /srv/funkwhale 0775 funkwhale funkwhale' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
