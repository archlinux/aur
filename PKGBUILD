# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=google-cloud-cli-gke-gcloud-auth-plugin
pkgver=427.0.0
pkgrel=1
pkgdesc="A google-cloud-cli component that provides a kubectl authentication plugin for GKE."
arch=('x86_64')
url="https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke"
license=('Apache')
depends=('google-cloud-cli')
conflicts=('gooogle-cloud-sdk-gke-gcloud-auth-plugin')
replaces=('gooogle-cloud-sdk-gke-gcloud-auth-plugin')
options=('!strip')
source=(
    "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig_amd64.tar.gz"
    'google-cloud-cli-gke-gcloud-auth-plugin.sh')
sha256sums=('4b39a92fb3c0e5f1b694e0fedc6a873113e6c7ecab30b755b9cbab3194627ba7'
            '4432c1e71c39cb0914baa4df6c8699adc7e633163da7be87ac159d5b320cb346')
install="${pkgname}.install"

package() {
    cd "$srcdir/google-cloud-sdk"  # Does not match naming convention google-cloud-cli

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
