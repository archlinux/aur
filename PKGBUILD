# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgbase=aider-chat
pkgname=(
  'aider-chat'
  'aider-chat-docs'
)
_gitpkgname=aider
pkgver=0.86.2
pkgrel=2
pkgdesc='AI pair programming in your terminal'
arch=('any')
url='https://github.com/Aider-AI/aider'
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

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/Aider-AI/aider/archive/v${pkgver}.tar.gz"
  'archlinux-use-system.patch'
  'aur-install-notice.patch'
  'fix-build-from-tarball.patch'
  'github-pr-4832.patch'
  'github-pr-4935.patch'
)

sha512sums=('304a7ed346ba397c21a7aa3a6563d2cffca9c95a8a67e98a93c14fdd9c86f24ff41224cdd31aebb7e3940a98ac07825ed3a7a6720143178116d9204f17021562'
            '18acc792128e0748c099e0daa7061c780a43fdb384251f980ff36424b5450cb35e885a8e84af4990923db76a1f30e39a2e1a178eaf88409c0818e4ee134f1644'
            '39466f05535330372d3f89a361b3984ef82bfdbf3e1b9f359cc0c039bbe098163c4253634155d74dd3971145131fa12afdfc9aff001f05b8cd0840b870a68555'
            'd784c2dae03810cb69059bdc399c437d6a8a8d9d746d69fce2b2a4b3fb5536dbf437918799a57278ae74eeb491233ae4bf38e7f56533210ad89df92f9128deac'
            '3e6d1ff91365471ea344ea11013c8c4f996413898bb296605f8b1765a01d78ec690c22489ea688f7e093df862e60ea54bfb53ff77ffbedbf50e86af251414606'
            'b2caef0390e33c3530137ae7f3a5d6e0ea74966186e59bf1e0c5e646070e6f22972b44902b4847cba72d3d05ab07c141bfa1c70aebf3b6371dcb67a64b7380ad')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Replacing custom downloads with system packages'
  patch -p1 < ../archlinux-use-system.patch

  echo >&2 'Replacing auto-updater and optdepends installers with AUR notice'
  patch -p1 < ../aur-install-notice.patch

  # Needs to be upstreamed
  echo >&2 'Fixing incomplete build from source tarball'
  patch -p1 < ../fix-build-from-tarball.patch

  # Remove this patch once the upstream author has merged PR #4832 and
  # included it in a stable release.
  # See also: https://github.com/Aider-AI/aider/pull/4832
  echo >&2 'Applying patch to update LiteLLM exception list'
  patch -p1 < ../github-pr-4832.patch

  # Remove this patch once the upstream author has merged PR #4935 and
  # included it in a stable release.
  # See also: https://github.com/Aider-AI/aider/pull/4935
  echo >&2 'Applying patch to replace unavailable models in unit tests'
  patch -p1 < ../github-pr-4935.patch

  # Update Gemfile to allow newer version of the dependencies,
  # add undeclared dependencies, and remove dependencies not
  # relevant to this package
  echo >&2 'Updating dependencies in Gemfile'
  # shellcheck disable=SC2016  # Not meant to expand
  sed -i \
    -e 's/"\([0-9]\)/">=\1/g' \
    -e '$agem "jekyll-feed"' \
    -e "s/\(^gem 'github-pages'.*\)/#\1/" \
    -e 's/\(^gem "html-proofer".*\)/#\1/' \
    aider/website/Gemfile

  echo >&2 'Adjusting base URL for documentation'
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
  # - scraping tests that depend on specific responses from
  #   third-party services, which proved to be flaky at times
  #   (maybe due to rate limiting or other anti-scraping measures)
  #
  echo >&2 'Running unit tests'
  env -i PATH="${PATH}" python -m pytest \
    -k 'not test_get_commit_message and not TestHelp and not test_check_for_dependencies_ and not test_scraper_print_error_not_called'

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


# shellcheck disable=SC2128
package_aider-chat-docs() {
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
