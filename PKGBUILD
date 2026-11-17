# Original Maintainer: bko <aur at bil dot co dot ua>
# Maintainer: higorslva <higor.slva at outlook dot com>

pkgname=pgadmin4-server-bin
pkgver=9.19
pkgrel=1
pkgdesc='The core server package for pgAdmin (binary from Debian). pgAdmin is the most popular administration platform for PostgreSQL.'
arch=('x86_64')
url='https://www.pgadmin.org/'
license=('PostgreSQL')
makedepends=('python-pip' 'libarchive')
depends=('python' 'libedit' 'krb5' 'sqlite' 'postgresql-libs')
provides=('pgadmin4-server')
conflicts=('pgadmin4-server')

# The requirements URL points to the released tag, with '.' replaced by '_' in the version
source=(
  "pgadmin4-server-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/trixie/dists/pgadmin4/main/binary-amd64/pgadmin4-server_${pkgver}-1.trixie_amd64.deb"
  "requirements-${pkgver}.txt::https://raw.githubusercontent.com/pgadmin-org/pgadmin4/refs/tags/REL-${pkgver//./_}/requirements.txt"
)

# Real SHA256 of the pinned requirements file (maintained by the update script)
sha256sums=('31bb45844e179ca8979b14fccf49d59c17b7febd40061c47175443a1d35f8186'
            '5c3ad14b55a8694ea490e8d941edae70de89b6b85cc21f0711e68e735691ad68')

prepare() {
  msg2 "Extracting the debian package..."
  mkdir -p "${srcdir}/deb-content"
  
  bsdtar -xf "pgadmin4-server-${pkgver}-x86_64.deb" -C "${srcdir}"
  # bsdtar auto-detects the compression (data.tar.xz on Debian, data.tar.zst on Ubuntu)
  bsdtar -xf "${srcdir}"/data.tar.* -C "${srcdir}/deb-content"

  sed -i "s|ALLOW_SAVE_TUNNEL_PASSWORD = False|ALLOW_SAVE_TUNNEL_PASSWORD = True|" "${srcdir}/deb-content/usr/pgadmin4/web/config.py"
}

build() {
  msg2 "Creating isolated Python virtual environment..."
  cd "${srcdir}/deb-content/usr/pgadmin4"
  
  rm -rf venv
  python -m venv venv

  msg2 "Installing dependencies via pip (exact version ${pkgver})..."
  ./venv/bin/python -m pip install --upgrade pip setuptools wheel
  ./venv/bin/python -m pip install --no-cache-dir -r "${srcdir}/requirements-${pkgver}.txt"
}

package() {
  msg2 "Installing files into the package..."
  cp -r "${srcdir}/deb-content/usr" "${pkgdir}/"

  msg2 "Safely cleaning absolute VENV paths..."
  ln -sf python "${pkgdir}/usr/pgadmin4/venv/bin/python3"
  
  # Only alter text files inside the virtual environment
  find "${pkgdir}/usr/pgadmin4/venv/bin" -type f -executable -exec grep -Il '' {} + | xargs sed -i "s|${srcdir}/deb-content||g"
  
  install -dm755 "${pkgdir}/var/lib/pgadmin"
  install -dm755 "${pkgdir}/var/log/pgadmin"
}
