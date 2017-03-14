# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=pgadmin4
pkgver=1.3
pkgrel=1
pkgdesc="Comprehensive design and management interface for PostgreSQL"
arch=(i686 x86_64)
url="https://www.pgadmin.org/"
license=(custom)
depends=(qt5-webengine python postgresql-libs hicolor-icon-theme)
makedepends=(python-setuptools imagemagick)
source=(https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v$pkgver/source/$pkgname-$pkgver.tar.gz{,.sig}
        0001-Simplify-Server-s-python-setup.patch)
sha256sums=('c7f8a8585851d2f70e2d054e923c092d33631d10e83a8e2d18d8493fef6c670c'
            'SKIP'
            '02ca771755b28b2dcf21dc5d9ad0ef8d1203b15a3a041ae098bba9b235ba1dba')
validpgpkeys=('E0C4CEEB826B1FDA4FB468E024ADFAAF698F1519')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../0001-Simplify-Server-s-python-setup.patch
  convert runtime/pgAdmin4.{ico,png}
}

build() {
  export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

  cd $pkgname-$pkgver/runtime
  qmake CONFIG+=release
  make

  cd ..
  python -m venv venv
  venv/bin/pip install -r requirements.txt  # Downloads stuff :-(

  cp -a venv venv-runtime
  venv/bin/pip install sphinx
  PATH="$PWD/venv/bin:$PATH" make docs
}

package() {
  cd $pkgname-$pkgver

  install -D runtime/pgAdmin4 "$pkgdir/usr/lib/pgadmin4/runtime/pgAdmin4"

  cp -a docs web "$pkgdir/usr/lib/pgadmin4"
  cp -a venv-runtime "$pkgdir/usr/lib/pgadmin4/venv"

  cat >>"$pkgdir/usr/lib/pgadmin4/web/config_distro.py" <<END
SERVER_MODE = False
HELP_PATH = "/usr/lib/pgadmin4/docs/en_US/_build/html/"
END

  cat >>"$pkgdir/usr/lib/pgadmin4/web/config_local.py" <<END
END

### Launcher

  install -Dm644 runtime/pgAdmin4-0.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pgAdmin4.png"
  install -Dm644 runtime/pgAdmin4-1.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/pgAdmin4.png"
  install -Dm644 runtime/pgAdmin4-2.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/pgAdmin4.png"
  install -Dm644 runtime/pgAdmin4-3.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/pgAdmin4.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/pgAdmin4.desktop" <<END
[Desktop Entry]
Encoding=UTF-8
Name=pgAdmin 4
Exec=/usr/lib/pgadmin4/runtime/pgAdmin4
Icon=pgAdmin4
Type=Application
Categories=Application;Development;
MimeType=text/html
DocPath=/usr/lib/pgadmin4/docs/en_US/_build/html/index.html
Comment=PostgreSQL Tools
Keywords=database;db;sql;query;administration;development;
END

  install -D /dev/stdin "$pkgdir/usr/bin/pgadmin4" <<END
#!/bin/sh
exec /usr/lib/pgadmin4/runtime/pgAdmin4 "\$@"
END

### License

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
