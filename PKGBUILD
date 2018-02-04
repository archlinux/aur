# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Andrej Marolt <andrej.marolt@gmail.com>

_hash='ab0f056'
_build='1219'
pkgname='openshift-origin-server-bin'
pkgver='3.7.1'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=(
    "bash-completions-oc::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/oc"
    "bash-completions-openshift::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/openshift"
    "zsh-completions-oc::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/oc"
    "zsh-completions-openshift::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/openshift"
    "https://storage.googleapis.com/origin-ci-test/branch-logs/origin/v${pkgver}/builds/test_branch_origin_cross/${_build}/artifacts/zips/openshift-origin-server-v${pkgver}-${_hash}-linux-64bit.tar.gz"
)
sha512sums=(
    '1937ecfbc6240dc430408839f2a3bc28078c1b0b1c431934dc3fe9b27a51acbb9cf78e05ec98f1374103bf0df181eb60cdea44587aaf324b6ab870fa7a29e9c1'
    'b8d39f0d40ec87fca4a29b315ce78eb78f02ee03821a76b168b6267ca89ecfb6d56b16d8735e29e7a2436bfbec7e81196e1272f5b5af25d9c06f4a19d33983f6'
    'ea8112d066ac37eb989fdef903a9fe08ef09f09769843d072124416b7f85aef5f5b60185ef2dc86712f5656f059c91b0d8db6ebce42f8d81b7c2d165b4047058'
    '91c47fa9f215923ca852d128c5bd2eeea503fe3fc6e261123342a3c8b4d00d850e4961bbdbf072024c799adce92498a4a5bfb3e5c9045c4c75a460e33135b3d6'
    '15f650f8339ebec9df7c640788ebd46746ccad49c5e35032d1f6eee384791967200299f27cc582e2001758b2231ea49b04d55c635b8efd16288f40c574a06ccb'
)

# keep symbols
options=(!strip)

# skip compression
PKGEXT='.pkg.tar'

prepare() {
    # Fix zsh completion
    sed -i '1i#compdef oc'        $srcdir/zsh-completions-oc
    sed -i '1i#compdef openshift' $srcdir/zsh-completions-openshift
}

package() {
    # completions
    install -D -m644 $srcdir/bash-completions-oc        $pkgdir/usr/share/bash-completion/completions/oc
    install -D -m644 $srcdir/bash-completions-openshift $pkgdir/usr/share/bash-completion/completions/openshift
    install -D -m644 $srcdir/zsh-completions-oc         $pkgdir/usr/share/zsh/site-functions/_oc
    install -D -m644 $srcdir/zsh-completions-openshift  $pkgdir/usr/share/zsh/site-functions/_openshift

    # package
    install -D -m755 $srcdir/*/oc                      $pkgdir/usr/bin/oc
    install -D -m755 $srcdir/*/openshift               $pkgdir/usr/bin/openshift
    install -D -m755 $srcdir/*/kubefed                 $pkgdir/usr/bin/kubefed
    install -D -m755 $srcdir/*/template-service-broker $pkgdir/usr/bin/template-service-broker

    # symbolic links
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-apiserver
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-controller-manager
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-proxy
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-scheduler
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kubelet
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/oadm
    ln -s /usr/bin/oc        ${pkgdir}/usr/bin/kubectl
}
