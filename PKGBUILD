# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgbase=aider-chat
pkgname=(
  'aider-chat'
  'aider-chat-docs'
)
_gitpkgname=aider
pkgver=0.86.1
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
  'github-pr-4369.patch'
)

sha512sums=('0a0c44b5d91db839611f21c8062c2700fe728a1937cf1485375a94aa85c4330e3029547f8e464f2282f3ca21d58d9e1b0e68bc7ffd8190ef93eda2b768697c7f'
            '18acc792128e0748c099e0daa7061c780a43fdb384251f980ff36424b5450cb35e885a8e84af4990923db76a1f30e39a2e1a178eaf88409c0818e4ee134f1644'
            '39466f05535330372d3f89a361b3984ef82bfdbf3e1b9f359cc0c039bbe098163c4253634155d74dd3971145131fa12afdfc9aff001f05b8cd0840b870a68555'
            'd784c2dae03810cb69059bdc399c437d6a8a8d9d746d69fce2b2a4b3fb5536dbf437918799a57278ae74eeb491233ae4bf38e7f56533210ad89df92f9128deac'
            'fe4e0a66b853ab00d35be6929d60d5e86463918f51bf9d60c36e3afb3a4ab8857daba8629a3b7c8e6b6e2891bdecfcce98b53ba5c2bbe49d47297b0f7fec3620')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Replace custom downloads with system packages
  patch -p1 < ../archlinux-use-system.patch

  # Replace auto-updater and optdepends installers with AUR notice
  patch -p1 < ../aur-install-notice.patch

  # Fix issues with incomplete build from source tarball (needs upstreaming)
  patch -p1 < ../fix-build-from-tarball.patch

  # Remove this patch once the upstream author has merged PR #4369 and
  # included it in a stable release.
  # See also: https://github.com/Aider-AI/aider/pull/4369
  echo >&2 'Applying patch to fix tree-sitter integration'
  patch -p1 < ../github-pr-4369.patch

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
