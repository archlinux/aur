# Maintainer: Iliya Ivanov <i.ivanov@proforge.org>

_pkgname=pgadmin4
pkgname=${_pkgname}_last
pkgver=5.2
pkgrel=1
pkgdesc='Comprehensive design and management interface for PostgreSQL'
url='https://www.pgadmin.org/'
arch=('x86_64')
license=('custom')
replaces=("${_pkgname}")
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
depends=('postgresql-libs' 'hicolor-icon-theme' 'python' 'python-cheroot'
         'python-flask' 'python-flask-gravatar' 'python-flask-login'
         'python-flask-mail' 'python-flask-migrate' 'python-flask-sqlalchemy'
         'python-flask-wtf' 'python-flask-compress' 'python-passlib' 'python-pytz'
         'python-simplejson' 'python-six' 'python-speaklater' 'python-sqlparse'
         'python-wtforms' 'python-flask-paranoid' 'python-psutil' 'python-psycopg2'
         'python-dateutil' 'python-sqlalchemy' 'python-flask-security-too'
         'python-bcrypt' 'python-cryptography' 'python-sshtunnel' 'python-ldap3'
         'python-flask-babelex' 'python-gssapi')
makedepends=('python-html5lib' 'python-sphinx' 'python-testtools')
source=(https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${pkgver}/source/${_pkgname}-${pkgver}.tar.gz{,.asc}
        pgAdmin4.desktop
        config_distro.py
        config_local.py
        arch_additions.py)
validpgpkeys=('E8697E2EEF76C02D3A6332778881B2A8210976F2') # Package Manager (Package Signing Key) <packages@pgadmin.org>
sha512sums=('ad68c41d91ce37ca3e2c959eab814ebf6e58947abef8afae5556de39026638f52f9b586151f82f7d7bc641b7e332c3a0d9aafe84b08fca4fb6c3ebfbd9f78f03'
            'SKIP'
            '642d538fe7eb26748ed9d9933f668b48234e0b7a5baccd198674a79cb9e3f5d8b31754bf05fb6af05e7e89374c05aec8b1e5eb98891ae1e87e4c226ee5d6f9ab'
            '16d00dc2095904a6b12da7039458f632873829ad98d4d7653eac5804032ba92097ccae4488d56467d0ea9bd64e2654a3dead73eb7924c947ff1737ff6e3b4745'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
            'c8bcf9a38f2111b03032034e2cbe4942c07f9a76067c49ca3046da8a02c70c85e342297c3b864a5fa3d12fb2a276d6973bd81b4ef7576bd6aaa2e29ca983810f')

prepare() {
  cd ${_pkgname}-${pkgver}

  patch -Np1 < ../../pgAdmin4.py.patch

  local PYTHONVERSION="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"

  sed -E -i requirements.txt \
    -e '/cheroot>?=/d' \
    -e '/Flask>?=/d' \
    -e '/Flask-Gravatar>?=/d' \
    -e '/Flask-Login>?=/d' \
    -e '/Flask-Mail>?=/d' \
    -e '/Flask-Migrate>?=/d' \
    -e '/Flask-SQLAlchemy>?=/d' \
    -e '/Flask-WTF>?=/d' \
    -e '/Flask-Compress>?=/d' \
    -e '/passlib>?=/d' \
    -e '/pytz>?=/d' \
    -e '/simplejson>?=/d' \
    -e '/six>?=/d' \
    -e '/speaklater3>?=/d' \
    -e '/sqlparse>?=/d' \
    -e '/WTForms>?=/d' \
    -e '/Flask-Paranoid>?=/d' \
    -e '/psutil>?=/d' \
    -e '/psycopg2>?=/d' \
    -e '/python-dateutil>?=/d' \
    -e '/SQLAlchemy>?=/d' \
    -e '/Flask-Security-Too>?=/d' \
    -e '/bcrypt>?<?=/d' \
    -e '/cryptography>?<?=/d' \
    -e '/sshtunnel>?=/d' \
    -e '/ldap3>?=/d' \
    -e '/Flask-BabelEx>?<?=/d' \
    -e '/gssapi>?<?=/d' \
    -e '/^#.*/d' \
    -e '/^$/d'

  if [[ -s requirements.txt ]]; then
    echo "ERROR: requirements.txt must be empty:"
    cat requirements.txt
    exit 1
  fi
}

build() {
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
  export PGADMIN_PYTHON_DIR=/usr

  cd ${_pkgname}-${pkgver}
  # override doctree directory
  make docs SPHINXOPTS='-d /tmp/'

   cd runtime
#   yarn install
}

package() {
  cd ${_pkgname}-${pkgver}

  install -dm 755 "${pkgdir}/usr/lib/pgadmin4"
  cp -a docs web runtime "${pkgdir}/usr/lib/pgadmin4"
  install -Dm 644 "${srcdir}"/config_{distro,local}.py -t "${pkgdir}/usr/lib/pgadmin4/web"
  install -Dm 644 "${srcdir}"/arch_additions.py -t "${pkgdir}/usr/lib/pgadmin4/web"

  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
  convert runtime/assets/pgAdmin4.png -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pgAdmin4.png"
  convert runtime/assets/pgAdmin4.png -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/pgAdmin4.png"
  convert runtime/assets/pgAdmin4.png -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pgAdmin4.png"
  convert runtime/assets/pgAdmin4.png -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/pgAdmin4.png"
  install -Dm 644 "${srcdir}/pgAdmin4.desktop" -t "${pkgdir}/usr/share/applications"

#  install -D /dev/stdin "${pkgdir}/usr/bin/pgadmin4" <<END
#!/bin/sh
#cd /usr/lib/pgadmin4
#exec runtime/pgAdmin4 "\$@"
#END
  install -D /dev/stdin "${pkgdir}/usr/bin/pgadmin4" <<END
#!/bin/sh
cd /usr/lib/pgadmin4
export PGADMIN_INT_PORT=\$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()');
export PGADMIN_SERVER_MODE='OFF'
python web/pgAdmin4.py "\$@"
END

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
