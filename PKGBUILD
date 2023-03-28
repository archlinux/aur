# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Co-Maintainer: Ethan Pailes ethan[at]pailes[dot]org

# To be able to verify the gpg signatures run:
# ```
# gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 630D9F3CAB551AF3
# printf "trusted-key 630D9F3CAB551AF3\n" >> ~/.gnupg/gpg.conf
# ```

pkgname=snowflake-client
pkgver=1.2.24
pkgrel=1
epoch=1
pkgdesc="Snowflake Database command line client (snowsql)"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom:commercial')
depends=('gcc-libs'
         # Needed for libcrypt.so.1
         'libxcrypt-compat')
source=(
    "${pkgname}-${pkgver}.bash::https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/$(echo ${pkgver} | awk -F. '{print $1 "." $2}')/linux_x86_64/snowsql-${pkgver}-linux_x86_64.bash"
    "${pkgname}-${pkgver}.bash.sig::https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/$(echo ${pkgver} | awk -F. '{print $1 "." $2}')/linux_x86_64/snowsql-${pkgver}-linux_x86_64.bash.sig"
)
sha256sums=('e5c44e71a4fed99aedf23c9beaea0b21826bbc7fdc9f80090339d92588f3f806'
            'SKIP')

package() {
  # Stop Snowflake installer from modifying shell profile
  local tmp="$(mktemp)"

  SNOWSQL_DEST="${pkgdir}" SNOWSQL_LOGIN_SHELL="${tmp}" sh "${pkgname}-${pkgver}.bash"

  install -Dm755 "${pkgdir}/snowsql" "${pkgdir}/usr/bin/snowsql"
  rm -f "${pkgdir}/snowsql"
}
