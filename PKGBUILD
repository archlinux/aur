# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=google-cloud-sdk-gke-gcloud-auth-plugin
_debname=google-cloud-cli-gke-gcloud-auth-plugin
_debshasum=d2b7fd2e30cf3f83ddf710ea8520a85a462921d2ae33ca6c1038b1806a16a341 
pkgver=394.0.0
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
