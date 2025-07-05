# Maintainer: getzze <getzze at gmail dot com>

pkgname=funkwhale-venv
_pkgname=funkwhale
pkgver=1.4.1
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
        'libsasl'
        'postgresql'
        'redis'
        'python311'
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
        "funkwhale.target"
        "funkwhale-beat.service"
        "funkwhale-server.service"
        "funkwhale-worker.service"
        "apache-funkwhale.conf"
        "env-template"
        "funkwhale_manage"
)
sha256sums=('795faf2f233fbc9e77a3a6eed224c1413b5ed4edda390f363afc0c022479ec73'
            'f6d654a6f8d4cfbb1c59d86959d942529d49a1cdff0c77014645327c769105e0'
            '2906a075b41dcd2375c601482cb5a00e42cb87c613012b176c570d77918afbf2'
            '9e72558dee732c6783c597f5cb61e89ad346d4d3810d94f83afba2db580fb089'
            '5c821649d81d2d3a9aa52d872953696d5ae336906329a1c1b68871ce9c82fa59'
            '8f98e97b835225fdc2b89cfe2fa6f343d1fa36fdd5616c8585393ebd9c8169b8'
            'aecdf1a9283b6dc905820a5dd399bb00bbcab9819227ac438cb014d4ad1b5200'
            'd59bbf1a5bc82d2866fbfb5efa3f519469125ea9d4e24dfaa374f85ec6962ae7'
            'a5c51df1b8160b9e871d6e211c2668a6abbfabfad9e38d53d937b36162406450'
            'cea307055e9f8001a1507c507e1be91352d896cab17260a221f4ab8c298506d8'
            '202b1fe3ae4c8c3913d23646a8ebda7312f1725c3d69f15bee8cf599d9db62a9')
install=${pkgname}.install

prepare() {
  cd "$srcdir"

  ## change path of proxy parameters
  sed 's#/etc/nginx/funkwhale_proxy.conf#/etc/webapps/funkwhale/funkwhale_proxy.conf#' nginx.template > nginx.template.patched
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
  python3.11 -m venv "$pkgdir"/usr/share/webapps/funkwhale/virtualenv
  source "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/bin/activate

  pip install --upgrade pip wheel
  pip install --editable ./api

  # Remove srcdir references in scripts
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/lib/python*/site-packages/funkwhale_api* \
    -maxdepth 2 -type f -exec sed -i "s#${srcdir}/api#/usr/share/webapps/${_pkgname}/api#g" {} +

  # Remove pkgdir references in scripts
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/bin/ \
    -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/pyvenv.cfg \
    -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/ \
    -type f -name "*.py[co]" -delete
  find "$pkgdir"/usr/share/webapps/funkwhale/virtualenv/ \
    -type d -name "__pycache__" -delete

  # deactivate virtualenv
  deactivate

  # install server config
  install -d "$pkgdir"/etc/webapps/${_pkgname}/config
  install -Dm644 funkwhale_proxy.conf "$pkgdir"/etc/webapps/${_pkgname}/.
  install -Dm644 nginx.template.patched "$pkgdir"/etc/webapps/${_pkgname}/nginx.template
  install -Dm644 apache-funkwhale.conf "$pkgdir"/etc/webapps/${_pkgname}/.
  install -Dm644 env-template "$pkgdir"/etc/webapps/${_pkgname}/env.template

  install -Dm644 funkwhale.target funkwhale{-beat,-worker,-server}.service -t "$pkgdir/usr/lib/systemd/system/"

  echo -e 'u funkwhale - "Funkwhale music server" /srv/funkwhale\nm funkwhale http' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'd /srv/funkwhale 0775 funkwhale funkwhale' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
