# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lerobot
_pkgname=lerobot
pkgver=0.7.0
pkgrel=1
_commit=410c095eacc0011d998a73383eb94abed2715af0
pkgdesc="State-of-the-art machine learning for real-world robotics"
arch=('any')
url="https://github.com/huggingface/lerobot"
license=('Apache-2.0')
depends=(
    'cmake>=3.29.0.1'
    'python>=3.12'
    'python-draccus>=0.11.6'
    'python-einops>=0.8.0'
    'python-gymnasium>=1.1.1'
    'python-huggingface-hub'
    # Full unchanged sidecar locking cases pass with Arch Filelock 4.0.10.
    'python-filelock>=4.0.10'
    'python-filelock<5.0.0'
    'python-fsspec>=2023.5.0'
    'python-numpy>=2.0.0'
    'python-opencv>=4.9.0'
    'python-packaging>=24.2'
    'python-pillow>=10.0.0'
    'python-pytorch>=2.7'
    'python-requests>=2.32.0'
    'python-safetensors>=0.4.3'
    'python-setuptools>=71.0.0'
    'python-termcolor>=2.4.0'
    'python-torchvision'
    'python-tqdm>=4.66.0'
    'python-yaml'
)
# CUDA variants provide the shared capability without a version. Keep the
# upstream minimum by rejecting older concrete providers, including VCS builds.
conflicts=(
    'python-torchvision<0.22.0'
    'python-torchvision-cuda<0.22.0'
    'python-torchvision-cuda12.9<0.22.0'
    'python-torchvision-git<0.22.0'
)
makedepends=(
    'git'
    'git-lfs'
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    # The dataset extra exercises LeRobotDataset recording, video encoding,
    # decoding and streaming. Arch's newer PyAV is checked by these tests.
    'python-av'
    'python-datasets'
    'python-httpx'
    'python-jsonlines'
    'python-pandas'
    'python-pyarrow'
    'python-pytest'
    'python-pytest-timeout'
    'python-torchcodec'
)
# Optional integrations retain upstream's own compatibility requirements.
# The package check below exercises the core CPU data-processing interfaces.
optdepends=(
    'ffmpeg: video encoding and dataset conversion'
    'python-accelerate: distributed policy training'
    'python-av: dataset video decoding'
    'python-can: Damiao and RobStride motor buses'
    'python-datasets: Hugging Face dataset integration'
    'python-deepdiff: dataset metadata comparisons'
    'python-diffusers: diffusion, Groot, and multi-task policies'
    'python-grpcio: asynchronous inference'
    'python-hidapi: gamepad teleoperation'
    'python-httpx: remote Hugging Face training jobs'
    'python-imageio: simulation video output'
    'python-jsonlines: dataset JSON Lines support'
    'python-matplotlib: plots and asynchronous inference visualization'
    'python-num2words: SmolVLA policy'
    'python-onnx: Unitree G1 model interchange'
    'python-onnxruntime: Unitree G1 inference'
    'python-openai: annotation pipeline'
    'python-pandas: dataset and annotation processing'
    'python-peft: parameter-efficient policy fine-tuning'
    'python-protobuf: asynchronous inference protocol'
    'python-pyarrow: dataset storage'
    'python-pygame: gamepad and HopeJR teleoperation'
    'python-pynput: keyboard teleoperation'
    'python-pydantic: SARM reward model configuration'
    'python-pyserial: serial hardware controllers'
    'python-pytest: docstring example runner (lerobot.utils.doctest_utils)'
    'python-pyzmq: LeKiwi, Unitree, and asynchronous transport'
    'python-scipy: scientific policy and simulation routines'
    'python-timm: Groot vision models'
    'python-torchcodec: TorchCodec dataset video decoding'
    'python-torchdiffeq: WallX policy'
    'python-transformers: transformer-based policies and tokenizers'
    'python-wandb: experiment tracking during training'
)
source=(
    "$pkgname::git+$url.git#tag=v$pkgver"
    'arch-rolling-dependencies.patch'
    'hub-runtime-version.patch'
    'check-hub-runtime.py'
    'filelock-tested-floor.patch'
    'pyav-codec-options.patch'
)
sha256sums=(
    'SKIP'
    '61d3faa094038e86d012737f574487fb6741829828cd3ecc34eabacd76c71f10'
    '96accce82714445db1f9f4a5b9334a52e49261a43456bcb009442635adc16019'
    'c201a04001ef9965dac6fdf8e796d3555fa0eea16dca89bf47462743f8e7ac79'
    'd140923e55e0965418037cde9f6c11d6cc0798fb5f006812d0c3140ba058e9c4'
    '3534f13365494964395366f90d5579e5183327e02e2768c3cab27a9105a94499'
)

prepare() {
    cd "$pkgname"

    [[ "$(git rev-parse HEAD)" == "$_commit" ]]

    # GitHub tag archives contain LFS pointer files. Fetch the exact objects
    # referenced by v$pkgver so the complete upstream fixture suite can run.
    git lfs install --local
    git remote remove lfs-upstream 2>/dev/null || true
    git remote add lfs-upstream "$url.git"
    git lfs pull lfs-upstream --include='tests/artifacts/**' --exclude=''
    git lfs checkout
    while IFS= read -r lfs_file; do
        if head -n 1 "$lfs_file" | grep -qx \
            'version https://git-lfs.github.com/spec/v1'; then
            printf 'Unresolved Git LFS fixture: %s\n' "$lfs_file" >&2
            return 1
        fi
    done < <(git lfs ls-files -n)

    # Arch moves faster than the conservative upstream dependency matrix.
    # Keep every still-valid cap and relax only versions covered by check().
    git apply --check ../arch-rolling-dependencies.patch
    git apply --whitespace=nowarn ../arch-rolling-dependencies.patch
    git apply --check ../filelock-tested-floor.patch
    git apply --whitespace=nowarn ../filelock-tested-floor.patch
    git apply --check ../hub-runtime-version.patch
    git apply --whitespace=nowarn ../hub-runtime-version.patch
    # PyAV 16 removed Codec.descriptor. Read codec-private options from a
    # codec context with Arch's PyAV, keeping the older interface working.
    git apply --check ../pyav-codec-options.patch
    git apply --whitespace=nowarn ../pyav-codec-options.patch
    # Upstream includes the Draccus choice-discriminator fix.
}

build() {
    cd "$pkgname"
    rm -rf build dist
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"

    local site_packages
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    rm -rf "$srcdir/lerobot-check" "$srcdir/lerobot-test-suite" \
        "$srcdir/lerobot-hf-home" "$srcdir/lerobot-pytest-tmp"
    python -m installer --destdir="$srcdir/lerobot-check" dist/*.whl
    mkdir -p "$srcdir/lerobot-test-suite"
    # Upstream tests read repository files beside tests/: CI scripts,
    # examples, Docker simulator configurations, benchmark definitions,
    # pyproject.toml and source modules loaded by path. Copy the complete
    # checked-out tree without Git metadata or build outputs. The src layout
    # is not importable from there, so lerobot still resolves to the wheel.
    tar -C "$srcdir/$pkgname" --exclude=./.git --exclude=./build \
        --exclude=./dist -cf - . | tar -C "$srcdir/lerobot-test-suite" -xf -

    cd "$srcdir/lerobot-test-suite"
    PYTHONPATH="$srcdir/lerobot-check$site_packages" \
        python "$srcdir/check-hub-runtime.py" "$srcdir/lerobot-check$site_packages"
    # Network: these cases download environments, datasets or checkpoints
    # from the Hugging Face Hub. All local environment, dataset and policy
    # tests still run, including recording, encoding and decoding videos.
    local -a hub_cases=(
        'tests/envs/test_envs.py::test_make_env_from_hub_with_trust[lerobot/cartpole-env]'
        'tests/envs/test_envs.py::test_make_env_from_hub_with_trust[lerobot/cartpole-env@main]'
        'tests/envs/test_envs.py::test_make_env_from_hub_with_trust[lerobot/cartpole-env:env.py]'
        'tests/envs/test_envs.py::test_make_env_from_hub_async'
        'tests/datasets/test_dataset_tools.py::test_convert_image_to_video_dataset'
        'tests/datasets/test_dataset_tools.py::test_convert_image_to_video_dataset_subset_episodes'
        'tests/datasets/test_datasets.py::test_factory[aloha-lerobot/aloha_sim_insertion_human-act]'
        'tests/datasets/test_datasets.py::test_factory[aloha-lerobot/aloha_sim_insertion_human_image-act]'
        'tests/datasets/test_datasets.py::test_factory[pusht-lerobot/pusht-diffusion]'
        'tests/datasets/test_datasets.py::test_factory[pusht-lerobot/pusht_image-vqbet]'
        'tests/datasets/test_datasets.py::test_backward_compatibility[lerobot/pusht]'
        'tests/datasets/test_datasets.py::test_backward_compatibility[lerobot/aloha_sim_insertion_human]'
        'tests/datasets/test_datasets.py::test_backward_compatibility[lerobot/xarm_lift_medium]'
        'tests/policies/test_policies.py::test_act_backbone_lr'
        'tests/policies/test_policies.py::test_backward_compatibility[lerobot/aloha_sim_insertion_human-act-policy_kwargs1-]'
        'tests/policies/test_relative_actions.py::test_roundtrip_3d'
        'tests/policies/test_relative_actions.py::test_roundtrip_2d'
        'tests/policies/test_relative_actions.py::test_stacked_state_anchors_on_the_current_frame'
        'tests/policies/test_relative_actions.py::test_no_mutation'
        'tests/policies/test_relative_actions.py::test_chunk_stats_have_larger_std_than_frame_stats'
        'tests/policies/test_relative_actions.py::test_full_pipeline_roundtrip'
        'tests/policies/test_relative_actions.py::test_normalized_relative_values_are_reasonable'
        'tests/policies/test_relative_actions.py::test_processor_step_roundtrip'
        'tests/policies/test_relative_actions.py::test_processor_step_disabled_is_noop'
        'tests/policies/test_relative_actions.py::test_relative_with_action_chunks'
        'tests/policies/test_relative_actions.py::test_relative_stats_match_actual_data_distribution'
        'tests/policies/test_relative_actions.py::test_quantile_normalization_roundtrip'
        'tests/policies/test_relative_actions.py::test_state_not_modified_by_relative_processor'
    )
    # Hardware encoders: Arch's FFmpeg provides the VA-API and QSV encoders,
    # which accept only hardware frames. These option tests assume the
    # encoders are absent (PyAV wheels) and use the software yuv420p default.
    # No VA-API or QSV device exists in the build environment.
    local -a hardware_cases=(
        'tests/datasets/test_video_encoding.py::TestCodecOptions::test_vaapi_options'
        'tests/datasets/test_video_encoding.py::TestCodecOptions::test_qsv_options'
    )
    # Docker simulator launch builds images from a source checkout. The
    # installed package reports that by design, so these need the source layout.
    local -a checkout_cases=(
        'tests/scripts/test_lerobot_env_server.py::test_docker_launch_selects_backend_from_overridden_config'
        'tests/scripts/test_lerobot_env_server.py::test_docker_launch_serves_an_envhub_repository'
        'tests/scripts/test_lerobot_env_server.py::test_docker_launch_builds_a_local_envhub_directory'
    )
    local -a deselect=()
    local node
    for node in "${hub_cases[@]}" "${hardware_cases[@]}" "${checkout_cases[@]}"; do
        deselect+=("--deselect=$node")
    done
    CUDA_VISIBLE_DEVICES='' \
    HF_HOME="$srcdir/lerobot-hf-home" \
    HF_HUB_OFFLINE=1 \
    LEROBOT_TEST_DEVICE='cpu' \
    PYTHONPATH="$srcdir/lerobot-check$site_packages" \
        python -m pytest tests -vv -rfEs --maxfail=10 --timeout=300 \
            --basetemp="$srcdir/lerobot-pytest-tmp" "${deselect[@]}"
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
