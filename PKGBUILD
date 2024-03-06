# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=luarocket
pkgver=0.1.0
pkgrel=1
pkgdesc='Vendor Lua rocks into a local project directory'
arch=('any')
url='https://github.com/jcrd/luarocket'
license=('MIT')
depends=('bash' 'luarocks')
checkdepends=('python-j2cli')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/jcrd/luarocket/archive/v${pkgver}.tar.gz"
  'foo-0.1.0-1.rockspec.template'
)

sha512sums=(
  'd10220ea35da48db261c5d3a28918238ecc11a54e2076a470b771a56185eb46bd14cfe9f377dcea69577c69c1c513cf84de0217266d72386c1d8f68582d87a2f'
  'c2deab0626acb6ba110b55b684aca8e89396c6c3ac549c0b83100c391f734618036de2070819b91b40cd2d3b6f7a74b244e21c97f130d5a92b74d31c29611d9f'
)

check() {
  local actual expected lua_ver test_project_root

  echo >&2 'Preparing test'
  expected='return "Hello, world!"'
  lua_ver="$(luarocks config --lua-ver)"
  test_project_root="$(mktemp -d)"
  cd "${test_project_root}"
  mkdir -pv foo-0.1.0 lua_modules/.rockspecs
  echo 'return "Hello, world!"' > foo-0.1.0/main.lua
  j2 -f env -o lua_modules/.rockspecs/foo-0.1.0-1.rockspec \
    "${srcdir}/foo-0.1.0-1.rockspec.template" - <<< "lua_ver=${lua_ver}"
  tar -c -f foo-0.1.0.tar.gz -vz foo-0.1.0

  echo >&2 "Checking 'luarocket tree'"
  "${srcdir}/${pkgname}-${pkgver}/luarocket" tree
  actual="$(cat ".lua_tree/share/lua/${lua_ver}/foo.lua")"
  _assert

  echo >&2 "Checking 'luarocket modules'"
  "${srcdir}/${pkgname}-${pkgver}/luarocket" modules
  actual="$(cat 'lua_modules/foo.lua')"
  _assert
}

_assert() {
  if [[ "${actual}" != "${expected}" ]]; then
    printf >&2 'Error: "%s" != "%s"\n' "${actual}" "${expected}"
    exit 1
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    'luarocket'

  echo >&2 'Packaging the README'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
