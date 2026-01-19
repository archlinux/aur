# Maintainer: Youcef NAFA <youcef.nafa at gmail>

pkgbase=cecli
pkgname=(
  'cecli'
)
_gitpkgname=cecli
pkgver=0.95.11
pkgrel=1
pkgdesc='AI pair programming in your terminal - dwash96 fork of AIDER with TUI and MCP support'
arch=('any')
url='https://github.com/dwash96/cecli'
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
  'python-rustworkx'
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
  'python-truststore'
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

conflicts=()

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/dwash96/cecli/archive/refs/tags/v${pkgver}.tar.gz"
  'archlinux_use_system_aur_notice.patch'
  'fix-build-from-tarball.patch'
)

sha512sums=('b76e4e4be5eb71a9bcb7397bec8ef52baf9a2872722cecad9b620ff0862b25f5b3a17ca7628cc55cf697e748b9a131658eab722014c2dd176bdd66cfcb31a5d4'
            'f0bb7869b9809c24372b2648726bbb1efbbcf11bcefc31f6fca15dde022d1c18afa9806eb4a3881d3035c54717ae941e3aa87f1044684fcc4ff0b3c32cb93588'
            'c1a3c9bb98f68656eba5ed62e0c46f0ebad679f5d19c220b9c22017c43436946506e96cf3a1b2b593be5a37ad791fdd61c04212c7674152ea786b725fd99dcfa')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Replace custom downloads with system packages
  # Replace auto-updater and optdepends installers with AUR notice
  patch -p1 < ../archlinux_use_system_aur_notice.patch

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
    cecli/website/Gemfile

  # Adjust base URL for documentation
  sed -i \
    -e 's|^\(url:\).*|\1 file:///usr/share/doc/'"${pkgbase}"'/html|' \
    cecli/website/_config.yml
  sed -i -E \
    -e 's|="(https://aider.chat)?/|="file:///usr/share/doc/'"${pkgbase}"'/html/|' \
    cecli/website/index.html
  find cecli/website -name '*.md' -exec sed -i -E \
    -e 's|]\((https://aider.chat)?/|](file:///usr/share/doc/'"${pkgbase}"'/html/|' \
    '{}' +

  # Include model-settings.yml in MANIFEST.in for wheel installation
  echo "include cecli/resources/model-settings.yml" >> MANIFEST.in
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
    > 'completions/bash/cecli'
  "test-env/bin/${_gitpkgname}" --shell-completions zsh \
    > 'completions/zsh/_cecli'

  cd cecli/website

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
  # - skip all failing tests for now, ObjectMock usage with await fails + dark mode + openai provider + llama_index + stream_Cache_Warning ..

  echo >&2 'Running unit tests'
  env -i PATH="${PATH}" python -m pytest \
    -k 'not test_get_commit_message and not TestHelp and not test_check_for_dependencies_ and not test_encodings_arg and not test_main_exit_calls_version_check and not test_mode_sets_code_theme and not test_env_file_variables and not test_verbose_mode_lists_env_vars and not test_list_models_includes_metadata_models and not test_list_models_includes_all_model_sources and not test_list_models_includes_openai_provider and not test_list_models_with_direct_resource_patch and not test_stream_cache_warning and not test_model_overrides_no_match_preserves_model_name'

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
package_cecli() {
  depends=("${_depends[@]}")
  optdepends=(
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
    'completions/bash/cecli'
  install -D -m 644 -t "${pkgdir}/usr/share/zsh/site-functions" \
    'completions/zsh/_cecli'
}

