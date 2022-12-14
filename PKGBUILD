# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=google-cloud-sdk-gke-gcloud-auth-plugin
pkgver=412.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides a kubectl authentication plugin for GKE."
arch=('x86_64')
url="https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke"
license=('Apache')
depends=('google-cloud-sdk')
options=('!strip')
source=(
    "https://storage.googleapis.com/cloud-sdk-release/for_packagers/linux/google-cloud-cli-gke-gcloud-auth-plugin_${pkgver}.orig_amd64.tar.gz"
    'google-cloud-sdk-gke-gcloud-auth-plugin.sh')
sha256sums=('38255834aa3bc5d7e75cda687f2ed796f064f5561ef8ddcdc7b0d53d45e88014'
            '4432c1e71c39cb0914baa4df6c8699adc7e633163da7be87ac159d5b320cb346')
install="${pkgname}.install"

package() {
    cd "$srcdir/google-cloud-sdk"

    # Install plugin manifests and snapshots
    manifests=(
        "gke-gcloud-auth-plugin-linux-x86_64.manifest"
        "gke-gcloud-auth-plugin-linux-x86_64.snapshot.json"
        "gke-gcloud-auth-plugin.manifest"
        "gke-gcloud-auth-plugin.snapshot.json"
    )
    for item in ${manifests[@]}; do
        install -Dm644 \
            ".install/${item}" \
            "${pkgdir}/opt/google-cloud-sdk/.install/${item}"
    done

    # Install plugin binary
    install -Dm755 \
        "bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/opt/google-cloud-sdk/bin/gke-gcloud-auth-plugin"

    # Symlink plugin binary
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s \
        "/opt/google-cloud-sdk/bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/usr/bin/gke-gcloud-auth-plugin"

    # Install profile.d environment exports
    install -Dm755 \
        "${srcdir}/google-cloud-sdk-gke-gcloud-auth-plugin.sh" \
        "${pkgdir}/etc/profile.d/google-cloud-sdk-gke-gcloud-auth-plugin.sh"
}
