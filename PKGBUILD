# Maintainer: Agustin Ciocchini <agustin.ciocchini@gmail.com>

pkgname=hermes-agent-git
pkgver=r1251.d502952
pkgrel=1
pkgdesc="The self-improving AI agent — creates skills from experience, improves them during use, and runs anywhere"
arch=('any')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
depends=(
  'python'
  'python-openai'
  'python-dotenv'
  'python-fire'
  'python-httpx'
  'python-rich'
  'python-tenacity'
  'python-yaml'
  'python-requests'
  'python-jinja'
  'python-pydantic'
  'python-prompt_toolkit'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-litellm: multi-provider LLM support'
  'python-typer: CLI enhancements'
  'python-platformdirs: platform-specific directories'
  'python-pyjwt: JWT authentication'
  'nodejs: browser tools and WhatsApp bridge'
  'ripgrep: file search tool'
  'ffmpeg: text-to-speech voice support'
)
provides=('hermes-agent')
conflicts=('hermes-agent')
source=("$pkgname::git+https://github.com/NousResearch/hermes-agent.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
