# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Co-Maintainer: Ethan Pailes ethan[at]pailes[dot]org

# To be able to verify the gpg signatures run:
# ```
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 37C7086698CB005C EC218558EABB25A1
# printf "trusted-key 37C7086698CB005C\ntrusted-key EC218558EABB25A1\n" >> ~/.gnupg/gpg.conf
# ```

pkgname=snowflake-client
pkgver=1.2.10
pkgrel=1
epoch=1
pkgdesc="Snowflake Database command line client (snowsql)"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
depends=('gcc-libs')
source=(
    "${pkgname}-${pkgver}.bash::https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/$(echo ${pkgver} | awk -F. '{print $1 "." $2}')/linux_x86_64/snowsql-${pkgver}-linux_x86_64.bash"
    "${pkgname}-${pkgver}.bash.sig::https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/$(echo ${pkgver} | awk -F. '{print $1 "." $2}')/linux_x86_64/snowsql-${pkgver}-linux_x86_64.bash.sig"
)
sha256sums=(
    '0b7e620efab22df2a22bc80bae81544628a2eb4117a76ec109cfead6e8334c3c'
    'f5ecd6ffe307f559c8041c54f57ce4c93e408d6828e573a2411d39d7f7257725'
)

package() {
  # Stop Snowflake installer from modifying shell profile
  local tmp="$(mktemp)"

  SNOWSQL_DEST="${pkgdir}" SNOWSQL_LOGIN_SHELL="${tmp}" sh "${pkgname}-${pkgver}.bash"

  install -Dm755 "${pkgdir}/snowsql" "${pkgdir}/usr/bin/snowsql"
  rm -f "${pkgdir}/snowsql"
}
