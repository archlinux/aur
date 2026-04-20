# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Co-Maintainer: Ethan Pailes ethan[at]pailes[dot]org

# To be able to verify the gpg signatures run:
# ```
# gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 3C98F63C9292CE02
# ```

pkgname=snowflake-client
pkgver=1.5.0
_bootstrap=1.5
pkgrel=1
epoch=1
pkgdesc="Snowflake Database command line client (snowsql)"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom:commercial')
depends=('gcc-libs' 'unzip'
         # Needed for libcrypt.so.1
         'libxcrypt-compat')
source=(
    "${pkgname}-${pkgver}.bash::https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/${_bootstrap}/linux_x86_64/snowsql-${pkgver}-linux_x86_64.bash"
    "${pkgname}-${pkgver}.bash.sig::https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/${_bootstrap}/linux_x86_64/snowsql-${pkgver}-linux_x86_64.bash.sig"
)
sha256sums=('3124e9b642fab946e701e64e72417fa90797a5708156d3d974eeaf9bea4402c3'
            'SKIP')
validpgpkeys=('6C983AB7AFE2E5951C6C47B13C98F63C9292CE02')

package() {
  # Stop Snowflake installer from modifying shell profile
  local tmp="$(mktemp)"

  SNOWSQL_DEST="${pkgdir}" SNOWSQL_LOGIN_SHELL="${tmp}" sh "${pkgname}-${pkgver}.bash"

  install -Dm755 "${pkgdir}/snowsql" "${pkgdir}/usr/bin/snowsql"
  rm -f "${pkgdir}/snowsql"
}
