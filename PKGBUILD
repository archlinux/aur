# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=google-cloud-sdk-gke-gcloud-auth-plugin
_debname=google-cloud-cli-gke-gcloud-auth-plugin
_debshasum=96e71a32bf770ef087e1067167da91b3b6644c7fbf83a6668571f32b9c7cb046 
pkgver=391.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides a kubectl authentication plugin for GKE."
arch=('x86_64')
url="https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke"
license=('Apache')
depends=('google-cloud-sdk')
options=('!strip')
source=("$pkgname-$pkgver.deb::https://packages.cloud.google.com/apt/pool/${_debname}_${pkgver}-0_amd64_${_debshasum}.deb")
sha256sums=("$_debshasum")
install="${pkgname}.install"

prepare() {
    tar -axvf "${srcdir}/data.tar.xz"
}

package() {
    cd "$srcdir"

    # Install plugin manifests and snapshots
    manifests=(
        "gke-gcloud-auth-plugin-linux-x86_64.manifest"
        "gke-gcloud-auth-plugin-linux-x86_64.snapshot.json"
        "gke-gcloud-auth-plugin.manifest"
        "gke-gcloud-auth-plugin.snapshot.json"
    )
    for item in ${manifests[@]}; do
        install -Dm644 \
            "${srcdir}/usr/lib/google-cloud-sdk/.install/${item}" \
            "${pkgdir}/opt/google-cloud-sdk/.install/${item}"
    done

    # Install plugin binary
    install -Dm755 \
        "${srcdir}/usr/lib/google-cloud-sdk/bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/opt/google-cloud-sdk/bin/gke-gcloud-auth-plugin"

    # Symlink plugin binary
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s \
        "/opt/google-cloud-sdk/bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/usr/bin/gke-gcloud-auth-plugin"
}
