# Maintainer: David Birks <david@birks.dev>

pkgname=mcp-agent-mail
pkgver=0.3.0
pkgrel=1
pkgdesc='Coordinated multi-agent messaging and coordination MCP server'
arch=('any')
url='https://github.com/Dicklesworthstone/mcp_agent_mail'
license=('MIT')
depends=('python' 'python-httpx' 'python-typer' 'python-uvicorn' 'python-rich' 'python-sqlalchemy')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('mcp-agent-mail-git')
options=('!debug')
source=(
  "https://github.com/Dicklesworthstone/mcp_agent_mail/releases/download/v${pkgver}/mcp_agent_mail-${pkgver}.tar.gz"
  'mcp-agent-mail'
)
b2sums=('92eaa28f1466b573c9a6915328ee99afc8589779592c7ce7eba11db6cf6605324b4cfffd57d23c4541b9bfa71382ff9da031c7adc93873b3f6704d08aea82800'
        '2f45be2db15497129a6bd5f58470d45c4dd0b42d86606aa1882d13f86564e9dc4b65e656d913ff7b7295ea2a703bdc74f5e6f4ed40c8bc42a92ba646be1773c5')

build() {
  cd "mcp_agent_mail-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "mcp_agent_mail-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install wrapper script (upstream doesn't define console_scripts)
  install -Dm755 "$srcdir/mcp-agent-mail" "$pkgdir/usr/bin/mcp-agent-mail"

  # Create 'am' symlink
  ln -s mcp-agent-mail "$pkgdir/usr/bin/am"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
