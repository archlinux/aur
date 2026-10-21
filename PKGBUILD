# Maintainer: Andrew Mello <andrew@88plug.com>
pkgname=k3d-gpu
pkgver=0.1.72
pkgrel=1
pkgdesc="Bootstrap GPU-ready k3d clusters: launcher + NVIDIA device plugin manifest for k3s on Docker"
arch=('any')
url="https://github.com/88plug/k3d-gpu"
license=('custom:FSL-1.1-ALv2')
depends=('bash')
optdepends=(
    'docker: container runtime for the cluster'
    'rancher-k3d-bin: k3d CLI to manage clusters'
    'kubectl: query and apply manifests'
    'nvidia-container-toolkit: GPU container runtime for Docker'
    'python: k3d-gpu-mcp (the MCP server for AI agents), k3d-gpu facts, plan, audit, tune and capacity'
)
source=("git+https://github.com/88plug/k3d-gpu.git#tag=aur-v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 scripts/k3d-gpu              "$pkgdir/usr/bin/k3d-gpu"
    install -Dm755 scripts/k3d-gpu-mcp          "$pkgdir/usr/bin/k3d-gpu-mcp"
    install -Dm644 share/nvidia-device-plugin.yml "$pkgdir/usr/share/k3d-gpu/nvidia-device-plugin.yml"
    install -Dm644 share/intel-gpu-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-gpu-plugin.yml"
    install -Dm644 share/intel-gpu-wsl-plugin.yml "$pkgdir/usr/share/k3d-gpu/intel-gpu-wsl-plugin.yml"
    install -Dm644 share/intel-gpu-dra.yml      "$pkgdir/usr/share/k3d-gpu/intel-gpu-dra.yml"
    install -Dm644 share/intel-npu-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-npu-plugin.yml"
    install -Dm644 share/intel-dsa-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-dsa-plugin.yml"
    install -Dm644 share/nri-balloons.yml       "$pkgdir/usr/share/k3d-gpu/nri-balloons.yml"
    install -Dm644 share/nri-balloons-guard.yml "$pkgdir/usr/share/k3d-gpu/nri-balloons-guard.yml"
    install -Dm644 share/intel-iaa-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-iaa-plugin.yml"
    install -Dm644 share/intel-qat-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-qat-plugin.yml"
    install -Dm644 share/gaudi-device-plugin.yml "$pkgdir/usr/share/k3d-gpu/gaudi-device-plugin.yml"
    install -Dm644 share/agent-chat-ui.yml      "$pkgdir/usr/share/k3d-gpu/agent-chat-ui.yml"
    install -Dm644 share/npu-embeddings.yml     "$pkgdir/usr/share/k3d-gpu/npu-embeddings.yml"
    install -Dm644 share/node-feature-discovery.yml "$pkgdir/usr/share/k3d-gpu/node-feature-discovery.yml"
    local f
    for f in share/telemetry/*.yml share/telemetry/optional/*.yml; do
        install -Dm644 "$f" "$pkgdir/usr/share/k3d-gpu/${f#share/}"
    done
    for f in console/*.py console/*.json; do
        install -Dm644 "$f" "$pkgdir/usr/share/k3d-gpu/$f"
    done
    install -Dm644 images.lock "$pkgdir/usr/share/k3d-gpu/images.lock"
    install -Dm755 -t "$pkgdir/usr/share/k3d-gpu/bench" bench/vs.py bench/llm_load.py bench/energy.sh
    install -Dm644 bench/competitors.lock "$pkgdir/usr/share/k3d-gpu/bench/competitors.lock"
    for f in agent_trace.py agent_trace_gen.py apb/apb.py apb/capacity.py; do
        install -Dm644 "bench/$f" "$pkgdir/usr/share/k3d-gpu/bench/$f"
    done
    for f in bundle.py project.py validate.py share.py schema/bundle-v1.json; do
        install -Dm644 "oracle/$f" "$pkgdir/usr/share/k3d-gpu/oracle/$f"
    done
    install -Dm644 share/agent-sandbox.yml      "$pkgdir/usr/share/k3d-gpu/agent-sandbox.yml"
    install -Dm644 share/agent-sandbox-k3d.yml  "$pkgdir/usr/share/k3d-gpu/agent-sandbox-k3d.yml"
    install -Dm644 share/model-share.yml        "$pkgdir/usr/share/k3d-gpu/model-share.yml"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE.md    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
