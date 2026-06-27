# Maintainer: Lumaku <lumaku@mailbox.org>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit
pkgname=python-huggingface-hub-git
pkgver=1.21.0.r2538.g1e41293
pkgrel=1
_repo=huggingface/huggingface_hub
pkgdesc='Client library to download and publish models on the huggingface.co hub'
arch=('any')
url="https://github.com/${_repo}"
license=('Apache-2.0')
groups=('huggingface')
depends=(
    'python'
    'python-click'
    'python-filelock'
    'python-fsspec'
    'python-httpx'
    'python-packaging'
    'python-tqdm'
    'python-typer'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'git-lfs'
    'python-authlib'
    'python-duckdb'
    'python-fastapi'
    'python-itsdangerous'
    'python-jedi'
    'python-jinja'
    'python-numpy'
    'python-pillow'
    'python-pydantic'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-env'
    'python-pytest-mock'
    'python-pytest-timeout'
    'python-pytest-vcr'
    'python-pytest-xdist'
    'python-urllib3'
)
optdepends=(
    'python-torch: PyTorch-related features'
    'python-gradio: Gradio-related features'
    'python-authlib: OAuth support'
    'python-duckdb: hf datasets SQL support'
    'python-fastapi: OAuth support'
    'python-graphviz: graph rendering support'
    'python-hf-xet: Xet storage backend'
    'python-itsdangerous: OAuth support'
    'python-jinja: Model/dataset cards templating'
    'python-numpy: embeddings and inference array outputs'
    'python-pillow: Inference image features'
    'python-pydantic: webhook payload models'
    'python-pydot: graph rendering support'
    'python-safetensors: safetensors serialization support'
    'python-toml: fastai utilities'
)
provides=("python-huggingface-hub=${pkgver}")
conflicts=("python-huggingface-hub")
source=("${pkgname}::git+${url}")
b2sums=('SKIP')


pkgver() {
    cd "${pkgname}"
    local _ver _rev _sha
    _ver="$(git tag --list 'v*' --sort=-version:refname | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | head -1 | sed 's/^v//')"
    _rev="$(git rev-list --count HEAD)"
    _sha="$(git rev-parse --short=7 HEAD)"
    printf "%s.r%s.g%s" "${_ver}" "${_rev}" "${_sha}"
}


prepare() {
    cd "${pkgname}"
    git clean -dfx
}


build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation

    # Generate shell completions via Typer
    local _completions_dir="${srcdir}/completions"
    mkdir -p "${_completions_dir}"
    python -m venv --system-site-packages "${srcdir}/completions-venv"
    "${srcdir}/completions-venv/bin/python" -m installer dist/*.whl >/dev/null

    local _tool _upper _env_var
    for _tool in hf tiny-agents; do
        printf -v _upper "%s" "${_tool//-/_}"
        printf -v _env_var "_%s_COMPLETE" "${_upper^^}"
        export "${_env_var}=complete_zsh"
        "${srcdir}/completions-venv/bin/${_tool}" > "${_completions_dir}/_${_tool}"
    done
}


check() {
    local pytest_options=(
        -vv
        --override-ini="addopts="
        -W ignore::DeprecationWarning
        -n auto
        --timeout=300
        --timeout-method signal
        --deselect tests/test_buckets.py
        --deselect tests/test_buckets_cli.py
        --deselect tests/test_buckets_hf_file_system.py
        --deselect tests/test_cache_layout.py
        --deselect tests/test_cache_no_symlinks.py
        --deselect tests/test_commit_scheduler.py
        --deselect tests/test_file_download.py
        --deselect tests/test_hf_api.py
        --deselect tests/test_hf_file_system.py
        --deselect tests/test_inference_client.py
        --deselect tests/test_kernels.py
        --deselect tests/test_oauth.py::test_oauth_workflow
        --deselect tests/test_repocard.py
        --deselect tests/test_repository.py
        --deselect tests/test_snapshot_download.py
        --deselect tests/test_utils_cache.py
        --deselect tests/test_webhooks_server.py::test_deserialize_payload_example_with_comment
        --deselect tests/test_webhooks_server.py::test_deserialize_payload_example_without_comment
        --deselect tests/test_webhooks_server.py::test_deserialize_payload_example_with_updated_refs
        --deselect tests/test_utils_strict_dataclass.py::test_autocompletion_init_with_kwargs
        --deselect tests/test_utils_strict_dataclass.py::test_autocompletion_init_without_kwargs
        --deselect tests/test_utils_strict_dataclass.py::test_autocompletion_attribute_with_kwargs
        --deselect tests/test_utils_strict_dataclass.py::test_autocompletion_attribute_without_kwargs
        --deselect tests/test_login_utils.py::TestSetGlobalStore::test_set_store_as_git_credential_helper_globally
        --deselect tests/test_xet_upload.py::TestXetLargeUpload::test_upload_large_folder_batch_size_greater_than_one
        --deselect tests/test_cli.py::TestDownloadCommand::test_download_with_all_options
        --deselect tests/test_cli_output.py
        --deselect tests/test_cli.py
        --deselect tests/test_cli_discussions.py
        --deselect tests/test_copy_files.py
    )

    cd "${pkgname}"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}


package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl >/dev/null

    # Zsh completions (generated at build time)
    local _completions_dir="${srcdir}/completions"
    local _tool
    for _tool in hf tiny-agents; do
        install -Dm644 "${_completions_dir}/_${_tool}" "${pkgdir}/usr/share/zsh/site-functions/_${_tool}"
    done

    # Bash completions (delegation wrappers — Typer 0.25 lacks static bash source generation)
    local _bash_dir="${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 /dev/stdin "${_bash_dir}/hf" <<'BASH'
_hf_completion() {
    local IFS=$'\n'
    COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]}" COMP_CWORD="${COMP_CWORD}" _HF_COMPLETE=complete_bash hf 2>/dev/null))
}
complete -F _hf_completion hf
BASH
    install -Dm644 /dev/stdin "${_bash_dir}/tiny-agents" <<'BASH'
_tiny_agents_completion() {
    local IFS=$'\n'
    COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]}" COMP_CWORD="${COMP_CWORD}" _TINY_AGENTS_COMPLETE=complete_bash tiny-agents 2>/dev/null))
}
complete -F _tiny_agents_completion tiny-agents
BASH
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
