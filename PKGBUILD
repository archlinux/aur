# Original Maintainer: bko <aur at bil dot co dot ua>
# Maintainer: higorslva <higor.slva at outlook dot com>

pkgname=pgadmin4-server-bin
pkgver=9.14
pkgrel=1
pkgdesc='The core server package for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.'
arch=('x86_64')
license=('PostgreSQL')
makedepends=('python-pip')
depends=('python' 'libedit' 'krb5' 'sqlite' 'postgresql-libs')
provides=('pgadmin4-server')
conflicts=('pgadmin4-server')
source=("pgadmin4-server-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/plucky/dists/pgadmin4/main/binary-amd64/pgadmin4-server_${pkgver}-1.plucky_amd64.deb"
        "requirements.txt::https://raw.githubusercontent.com/pgadmin-org/pgadmin4/refs/heads/master/requirements.txt")
#source=("pgadmin4-server-${pkgver}-x86_64.deb::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/plucky/dists/pgadmin4/main/binary-amd64/pgadmin4-server_${pkgver}_amd64.deb")
sha256sums=('2e136c4458c20328bf27a2a32e6c136bc01cd79eaedeebe33f20ec5f18e49ab9'
            'SKIP')

package() {
  # Extract package data
  tar -x --zstd -f data.tar.zst -C "${pkgdir}"
  sed -i "s|ALLOW_SAVE_TUNNEL_PASSWORD = False|ALLOW_SAVE_TUNNEL_PASSWORD = True|" "${pkgdir}/usr/pgadmin4/web/config.py"

  msg2 "A criar ambiente virtual isolado para Python 3.14..."
  rm -rf "${pkgdir}/usr/pgadmin4/venv"
  python -m venv "${pkgdir}/usr/pgadmin4/venv"

  msg2 "A instalar dependências do requirements.txt..."
  
  "${pkgdir}/usr/pgadmin4/venv/bin/python" -m pip install --upgrade pip setuptools wheel

  "${pkgdir}/usr/pgadmin4/venv/bin/python" -m pip install --no-cache-dir \
    -r "${srcdir}/requirements.txt"

  msg2 "A ajustar executáveis e caminhos do venv..."
  ln -sf python "${pkgdir}/usr/pgadmin4/venv/bin/python3"
  find "${pkgdir}/usr/pgadmin4/venv/bin" -type f -executable -exec sed -i "s|${pkgdir}||g" {} +

  install -dm775 "${pkgdir}/var/lib/pgadmin"
  install -dm775 "${pkgdir}/var/log/pgadmin"
}
