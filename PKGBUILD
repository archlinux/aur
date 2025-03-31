# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgbase=aider-chat
pkgname=(
  'aider-chat'
  'aider-chat-docs'
)
_gitpkgname=aider
pkgver=0.80.0
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
  'python-grep-ast>=0.8.1'
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
  'aider-chat-docs: offline documentation'
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
  'github-pr-3692.patch'
)

sha512sums=('a0aad679ead5adf5047514cd717c3ed73d48c152bf700efbacb13ef09f91ffa173ce3eb42884db70ebac9ce96b952549397d17ddf8ceabecfc713b5f8fe2ef53'
            'abd72fc596f3b5f0e96dfe069f017d3cdbb8700d1734f32c6b4b2cc9d61b06a66eed4151959b013cae52cf3339d02715d6cc4d83e9e3ba473d739fcf6e0bdd2c'
            'a6fb5e00ae88ed02db00b61b36bb4b5ffef3e79ccfdc2314c9a702f50ffe4d7e5556a0b1eceb21c23b3d8ed2192af7eb47b6676bd0d9aaa568a7797b6badd174'
            '87b05d1b08007f32707fc9ed598eb6d31af1c29f5e4bcebf4a4fe08c4a6042ebb6c56dee8cb8e86e17be91af801a8852e4b39344d90da1990b44130b0b51125b'
            '914cb0e6d4dfa807f57cbbff8b8c8bde8c245e01a4585eedea79c08a705d5b1a00f13ef78d371b6342c04960acb874e273cb4b4510432644dd85ab287b8b85c6')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Remove this patch once the upstream author has merged PR #3692 and
  # included it in a stable release.
  # See also: https://github.com/Aider-AI/aider/pull/3692
  patch -p1 < ../github-pr-3692.patch

  # Replace custom downloads with system packages
  patch -p1 < ../archlinux-use-system.patch

  # Replace auto-updater and optdepends installers with AUR notice
  patch -p1 < ../aur-install-notice.patch

  # Fix issues with incomplete build from source tarball (needs upstreaming)
  patch -p1 < ../fix-build-from-tarball.patch

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
  sed -i -E \
    -e 's|="(https://aider.chat)?/|="file:///usr/share/doc/'"${pkgbase}"'/html/|' \
    aider/website/index.html
  find aider/website -name '*.md' -exec sed -i -E \
    -e 's|]\((https://aider.chat)?/|](file:///usr/share/doc/'"${pkgbase}"'/html/|' \
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
  # - dependency tests for Bedrock and Vertex AI models:
  #   not applicable because dependencies have been replaced with
  #   optdepends
  #
  echo >&2 'Running unit tests'
  env -i PATH="${PATH}" python -m pytest \
    -k "not test_get_commit_message`
      ` and not TestHelp`
      ` and not test_check_for_dependencies_"

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
  optdepends=()

  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgbase}" \
    README.md
  mkdir "${pkgdir}/usr/share/doc/${pkgbase}/html"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgbase}/html" \
    aider/website/_site/{assets,docs,examples,HISTORY.html,index.html,share}

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
