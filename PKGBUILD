# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgbase=aider-chat
pkgname=(
  'aider-chat'
  'aider-chat-docs'
)
_gitpkgname=aider
pkgver=0.75.0
pkgrel=1
pkgdesc='AI pair programming in your terminal'
arch=('any')
url='https://github.com/Aider-AI/aider'
license=('Apache-2.0')
depends=(
  'flake8'
  'litellm'
  'python'
  'python-beautifulsoup4'
  'python-configargparse'
  'python-diff-match-patch'
  'python-diskcache'
  'python-dotenv'
  'python-gitpython'
  'python-grep-ast'
  'python-httpx'
  'python-importlib_resources'
  'python-json5'
  'python-jsonschema'
  'python-mixpanel'
  'python-networkx'
  'python-numpy'
  'python-packaging'
  'python-pathspec'
  'python-pexpect'
  'python-pillow'
  'python-posthog'
  'python-prompt_toolkit'
  'python-psutil'
  'python-pydub'
  'python-pygments'
  'python-pypandoc'
  'python-pyperclip'
  'python-requests'
  'python-rich'
  'python-sounddevice'
  'python-soundfile'
  'python-tqdm'
  'python-tree-sitter-language-pack'  # undeclared transitive dependency of grep-ast
  'python-watchfiles'
  'python-yaml'
)
makedepends=(
  'jekyll'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
  'ruby-jekyll-feed'
  'ruby-jekyll-redirect-from'
  'ruby-jekyll-sitemap'
  'ruby-just-the-docs'
  'ruby-rake'
)
checkdepends=(
  'chromium'
  'python-playwright'
  'python-pytest'
  'python-streamlit'
)
# shellcheck disable=SC2016  # Not meant to expand
optdepends=(
  'chromium: for web scraping'
  # Packages are yet to be written, see comment in `check()`
  # 'python-llama-index-embeddings-huggingface: to use the interactive `/help` feature'
  'python-playwright: for web scraping'
  'python-streamlit: for a graphical user interface'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/Aider-AI/aider/archive/v${pkgver}.tar.gz"
  'archlinux-use-system.patch'
  'aur-install-notice.patch'
  'fix-build-from-tarball.patch'
  'tslp-fix-repomap.patch'
  'update-repomap-fixture.patch'
)

sha512sums=(
  '5c006f42764a49e0d5aa1e8735e97abf3ca3c88c6bd786ab238e893539b96142d1f7e166bb3d78be1fac241d1c4d0343ce57a187af71365e6ebfc5c1f63d82c2'
  'd74a96ab4949017eb52b6014ee5ae773cf81b0384e2823ae507aabcf00a947e160bad3fde0a999a13ce82efb78651a0e2aa06e96646ba686772f0d6c1532c682'
  '45349279dd93107c96e695dc6ffddd5ebdb10e95b36bdbc0da17ebcedcf36b35710973fec02ae5b50e864db4e3db845e87373637227b81d8c15d3d8a65311a5f'
  '87b05d1b08007f32707fc9ed598eb6d31af1c29f5e4bcebf4a4fe08c4a6042ebb6c56dee8cb8e86e17be91af801a8852e4b39344d90da1990b44130b0b51125b'
  'b59f7783083d19de6f5da2c1de9df9a2871e3535f1e46c5ce0391b98707badeb874f93978965ccaa713d50d4aa4d0ee46411d473ae43ae888b28c9642a9549a4'
  'eefbd517388ee1773c8e659727b2364f34310567768ae66f09e4160399869ee98a58df53e495e6eb167ce08a7e53830a58854084aa9f979a9ba56fd44e56a87a'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Replace custom downloads with system packages
  patch -p1 < ../archlinux-use-system.patch

  # Replace auto-updater and optdepends installers with AUR notice
  patch -p1 < ../aur-install-notice.patch

  # Fix issues with incomplete build from source tarball (needs upstreaming)
  patch -p1 < ../fix-build-from-tarball.patch

  # Work around regressions, which were caused by the switch from
  # tree-sitter-languages to tree-sitter-language-pack and have
  # already been fixed upstream.
  # Remove these patches once upstream has cut a new stable release.
  patch -p1 < ../tslp-fix-repomap.patch
  patch -p1 < ../update-repomap-fixture.patch

  # Update Gemfile to allow newer version of the dependencies,
  # add undeclared dependencies, and remove dependencies not
  # relevant to this package
  #
  # shellcheck disable=SC2016  # Not meant to expand
  sed -i \
    -e 's/"\([0-9]\)/">=\1/g' \
    -e '$agem "jekyll-feed"' \
    -e "s/\(^gem 'github-pages'.*\)/#\1/" \
    -e 's/\(^gem "html-proofer".*\)/#\1/' \
    aider/website/Gemfile

  # Adjust base URL for documentation
  sed -i \
    -e 's|^\(url:\).*|\1 file:///usr/share/doc/'"${pkgbase}"'/html|' \
    aider/website/_config.yml
  sed -i \
    -e 's|(https://aider\.chat|(file:///usr/share/doc/'"${pkgbase}"'/html|' \
    aider/website/index.md
  find aider/website/docs -name '*.md' -exec sed -i \
    -e 's|](/|](file:///usr/share/doc/'"${pkgbase}"'/html/|' \
    '{}' +
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation

  cd aider/website

  echo >&2 'Generating HTML documentation'
  export JEKYLL_ENV=production
  jekyll build --baseurl "file:///usr/share/doc/${pkgbase}/html/"

  echo >&2 'Removing unnecessary files'
  find _site \
    -type f \
    -'(' \
      -name "install.ps1" -o \
      -name "install.sh" -o \
      -name "robots.txt" -o \
      -name "sitemap.xml" \
    -')' \
    -delete
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  # Use a clean environment (env -i) to avoid incurring unintended
  # LLM API usage costs.
  #
  # Additionally, skip the following tests:
  #
  # - tests for the `/help` feature, which require two system
  #   packages `python-llama-index-core` and `-embeddings-huggingface`
  #
  # - commit message tests, which require the current working dir
  #   to be part of a Git worktree
  #
  echo >&2 'Running unit tests'
  env -i PATH="${PATH}" python -m pytest \
    -k 'not test_get_commit_message and not TestHelp'

  echo >&2 'Testing the executable'
  test-env/bin/${_gitpkgname} --version > actual.txt
  if ! grep -qF "${_gitpkgname} ${pkgver}" actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

# shellcheck disable=SC2128
package_aider-chat() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}

# shellcheck disable=SC2128
package_aider-chat-docs() {
  depends=()

  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgbase}" \
    README.md
  mkdir "${pkgdir}/usr/share/doc/${pkgbase}/html"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgbase}/html" \
    aider/website/_site/*

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
