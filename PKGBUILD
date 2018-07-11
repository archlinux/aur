# Maintainer: Stephen Smith <stephen304@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=pgadmin4-systray-fix
_pkgname=pgadmin4
pkgver=3.1
pkgrel=1
pkgdesc='Comprehensive design and management interface for PostgreSQL including patch fixing RM #3316.'
url='https://www.pgadmin.org/'
arch=('x86_64')
license=('custom')
depends=('qt5-base' 'python' 'python-psycopg2' 'postgresql-libs' 'hicolor-icon-theme')
makedepends=('python-setuptools' 'imagemagick')
provides=('pgadmin4')
conflicts=('pgadmin4')
source=(https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${pkgver}/source/${_pkgname}-${pkgver}.tar.gz
        pgAdmin4.desktop
        config_distro.py
        config_local.py
        RM_3316.patch)
validpgpkeys=('E0C4CEEB826B1FDA4FB468E024ADFAAF698F1519')
sha512sums=('e26801676969f3bc12cd4bdcb5b481b984b3500206393ae06e427894d354833287bf6b0e9b475ffa5fa73bafe6c7b266c453eef41c55396796c2b6036d8a7f5d'
            '25e6ae6658dd25aa9ebaccaef89ab15c19d513da3641fecaf9100d1139b0cc32c027f60a688f5fdff3b26e7be7897e33e9a7b4dddbf68599e583bd5b2e7946e9'
            '16d00dc2095904a6b12da7039458f632873829ad98d4d7653eac5804032ba92097ccae4488d56467d0ea9bd64e2654a3dead73eb7924c947ff1737ff6e3b4745'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
            'f04aaacefe745d13a038e13dbb74c1e2f43bb05b654252409e08be3dd2062e57ab3828b1101b6e64db6dfdd1732b385523d92119cb71bfb10b1eba279414c75e')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i ../RM_3316.patch
  local PYTHONVERSION="$(python -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  sed 's|value("PythonPath")|value("PythonPath", "/usr/lib/pgadmin4/venv/lib/python'${PYTHONVERSION}'/site-packages:/usr/lib/python'${PYTHONVERSION}'/site-packages:/usr/lib/python'${PYTHONVERSION}'")|g' -i runtime/{pgAdmin4.cpp,Server.cpp,TrayIcon.cpp}
  sed -r 's|(venv/lib/python)|\1'${PYTHONVERSION}'|g' runtime/Server.cpp
}


build() {
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  cd ${_pkgname}-${pkgver}
  convert runtime/pgAdmin4.{ico,png}

  python -m venv "${srcdir}/${_pkgname}-${pkgver}/venv"
  "${srcdir}/${_pkgname}-${pkgver}/venv/bin/python" -m pip install -r "${srcdir}/${_pkgname}-${pkgver}/requirements.txt"

  python -m venv "${srcdir}/${_pkgname}-${pkgver}/venv-docs"
  "${srcdir}/${_pkgname}-${pkgver}/venv-docs/bin/python" -m pip install -r "${srcdir}/${_pkgname}-${pkgver}/requirements.txt"
  "${srcdir}/${_pkgname}-${pkgver}/venv-docs/bin/python" -m pip install sphinx

  PATH="${srcdir}/${_pkgname}-${pkgver}/venv-docs/bin:${PATH}" make docs

  cd runtime
  qmake CONFIG+=release
  make
}


package() {
  cd "${_pkgname}-${pkgver}"

  install -D runtime/pgAdmin4 "${pkgdir}/usr/lib/pgadmin4/runtime/pgAdmin4"

  cp -a docs web "${pkgdir}/usr/lib/pgadmin4"
  cp -a venv "${pkgdir}/usr/lib/pgadmin4/venv"

  install -Dm 644 "${srcdir}"/config_{distro,local}.py -t "${pkgdir}/usr/lib/pgadmin4/web"

  ### fixup some python wonkyness
  local PYTHONVERSION="$(python -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  rm -r "${pkgdir}/usr/lib/pgadmin4/venv/lib/python${PYTHONVERSION}/site-packages/psycopg2"
  ln -s /usr/lib/python3.6/lib-dynload "${pkgdir}/usr/lib/pgadmin4/venv/lib/python${PYTHONVERSION}/lib-dynload"

  ### Launcher

  install -Dm 644 runtime/pgAdmin4-0.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pgAdmin4.png"
  install -Dm 644 runtime/pgAdmin4-1.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/pgAdmin4.png"
  install -Dm 644 runtime/pgAdmin4-2.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pgAdmin4.png"
  install -Dm 644 runtime/pgAdmin4-3.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/pgAdmin4.png"

  install -Dm 644 "${srcdir}/pgAdmin4.desktop" -t "${pkgdir}/usr/share/applications"

  install -D /dev/stdin "${pkgdir}/usr/bin/pgadmin4" <<END
#!/bin/sh
cd /usr/lib/pgadmin4
exec runtime/pgAdmin4 "\$@"
END
  install -D /dev/stdin "${pkgdir}/usr/bin/pgadmin4-server" <<END
#!/bin/sh
cd /usr/lib/pgadmin4
PYTHONPATH="/usr/lib/pgadmin4/venv/lib/python${PYTHONVERSION}/site-packages" python web/pgAdmin4.py "\$@"
END

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
