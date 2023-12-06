# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=google-cloud-cli-gke-gcloud-auth-plugin
pkgver=456.0.0
pkgrel=1
pkgdesc="A google-cloud-cli component that provides a kubectl authentication plugin for GKE."
arch=('x86_64')
url="https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke"
license=('Apache')
depends=('google-cloud-cli')
options=('!strip')
source=(
    "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig_amd64.tar.gz"
    'google-cloud-cli-gke-gcloud-auth-plugin.sh')
sha256sums=('01affc0dc8ccc18b2f16d8077060cefe4e03caa5c518a8606d5492488c76c4e4'
            '4432c1e71c39cb0914baa4df6c8699adc7e633163da7be87ac159d5b320cb346')

package() {
    cd "$srcdir/google-cloud-sdk"  # Does not match naming convention google-cloud-cli

    # Install plugin manifests and snapshots
    manifests=(
        "gke-gcloud-auth-plugin-linux-${CARCH}.manifest"
        "gke-gcloud-auth-plugin-linux-${CARCH}.snapshot.json"
        "gke-gcloud-auth-plugin.manifest"
        "gke-gcloud-auth-plugin.snapshot.json"
    )
    for item in ${manifests[@]}; do
        install -Dm644 \
            ".install/${item}" \
            "${pkgdir}/opt/google-cloud-cli/.install/${item}"
    done

    # Install plugin binary
    install -Dm755 \
        "bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/opt/google-cloud-cli/bin/gke-gcloud-auth-plugin"

    # Symlink plugin binary
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s \
        "/opt/google-cloud-cli/bin/gke-gcloud-auth-plugin" \
        "${pkgdir}/usr/bin/gke-gcloud-auth-plugin"

    # Install profile.d environment exports
    install -Dm755 \
        "${srcdir}/google-cloud-cli-gke-gcloud-auth-plugin.sh" \
        "${pkgdir}/etc/profile.d/google-cloud-cli-gke-gcloud-auth-plugin.sh"
}
