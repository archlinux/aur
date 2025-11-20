# Maintainer: Youcef NAFA <youcef.nafa at gmail>

pkgbase=aider-ce
pkgname=(
  'aider-chat-dwash96'
)
_gitpkgname=aider-ce
pkgver=0.88.21
pkgrel=1
pkgdesc='AI pair programming in your terminal - dwash96 fork with MCP support'
arch=('any')
url='https://github.com/dwash96/aider-ce'
license=('Apache-2.0')
_depends=(
  'litellm'
  'python'
  'python-beautifulsoup4'
  'python-configargparse'
  'python-diff-match-patch'
  'python-diskcache'
  'python-dotenv'
  'python-flake8'
  'python-gitpython'
  'python-google-generativeai'
  'python-grep-ast'
  'python-httpx'
  'python-importlib_resources'
  'python-json5'
  'python-jsonschema'
  'python-mixpanel'
  'python-networkx'
  'python-numpy'
  'python-oslex'
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
  'python-shtab'
  'python-sounddevice'
  'python-soundfile'
  'python-tqdm'
  'python-tree-sitter'
  'python-watchfiles'
  'python-yaml'
  'python-pytokens'
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
  # We need all runtime deps at build time to generate shell completions
  "${_depends[@]}"
)
checkdepends=(
  'chromium'
  'python-playwright'
  'python-pytest'
  'python-streamlit'
)

conflicts=('aider-chat')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/dwash96/aider-ce/archive/refs/tags/v${pkgver}.tar.gz"
  'archlinux-use-system.patch'
  'aur-install-notice.patch'
  'fix-build-from-tarball.patch'
)

sha512sums=('9906bc4d77553e36c6d2cebd59128dbf212797866af7bb8df10228b5f6b8a54064e98e97347a1f33952d72e06e2e5621d64e36739864a6ded318510feb685d40'
            'd06a880fbfbd394b37cca7c3c2243090a641c6d22eae7ce90afc5d906b1884d1b17c0ac8c97ec371fd6c4f8472555d86bb123bae90de101a10a0489ce202af78'
            'd5c1ae47bda83bf477fa5b1c9d172b7b5a6bff59b8563b768141f4c191b7e8f79e1dc9056d0a7b3113283513fc1ca50fabeabb2b288155a9001627d2cab222c5'
            '7a6c7b96f148d047bf4619dcfb748af28fb3e7adabcd5d612ad7318dc9e26d73cacc712de26b5f4c0de577b873c5b71c15c3bc149041435e7baa20bbc949f9c2')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Replace custom downloads with system packages
  patch -p1 < ../archlinux-use-system.patch

  # Replace auto-updater and optdepends installers with AUR notice
  # patch -p1 < ../aur-install-notice.patch

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

  echo >&2 'Generating shell completions'
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  mkdir -p completions/{bash,zsh}
  "test-env/bin/${_gitpkgname}" --shell-completions bash \
    > 'completions/bash/aider'
  "test-env/bin/${_gitpkgname}" --shell-completions zsh \
    > 'completions/zsh/_aider'

  cd aider/website

  echo >&2 'Generating HTML documentation'
  export JEKYLL_ENV=production
  jekyll build --baseurl "file:///usr/share/doc/${pkgbase}/html/"
}

check() {
  cd "${_gitpkgname}-${pkgver}"

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
    -k 'not test_get_commit_message and not TestHelp and not test_check_for_dependencies_'

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
package_aider-chat-dwash96() {
  depends=("${_depends[@]}")
  optdepends=(
    'aider-chat-docs: offline documentation'
    'chromium: for web scraping'
    'python-babel: support for more locales'
    # Packages are yet to be written, see comment in `check()`
    # 'python-llama-index-embeddings-huggingface: to use the interactive `/help` feature'
    'python-playwright: for web scraping'
    'python-streamlit: for a graphical user interface'
  )

  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt

  echo >&2 'Packaging shell completions'
  install -D -m 644 -t "${pkgdir}/usr/share/bash-completion/completions" \
    'completions/bash/aider'
  install -D -m 644 -t "${pkgdir}/usr/share/zsh/site-functions" \
    'completions/zsh/_aider'
}

