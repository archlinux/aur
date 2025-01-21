# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=HivisionIDPhotos
pkgbase=hivision-id-photos
pkgname=("${pkgbase}" "${pkgbase}-api" "${pkgbase}-web")
pkgver=1.3.1
pkgrel=1
pkgdesc="A lightweight and efficient AI ID photos tools"
arch=("any")
url="https://github.com/Zeyi-Lin/${_pkgname}"
license=('Apache-2.0')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}.sh"
        "${pkgbase}.sysusers"
        "${pkgbase}-api.env"
        "${pkgbase}-api.service"
        "${pkgbase}-api.sh"
        "${pkgbase}-web.env"
        "${pkgbase}-web.service"
        "${pkgbase}-web.sh")
sha256sums=('2edf4bf0b262778db9e0286c0526ad0e193d54762b5fe2552ce79e16690fa877'
            '772dff5b355a62f12c3df18b9e5df4decfd7af8092ac8f5436141bfbe8dc5a8c'
            '3b71a47e034de8a739dfbdc2238dc222f5d21207410273e5956ced9933b07979'
            '505c393e74a21276843fad83069b15f9b4b7b74742f4ea43de3f988485bbd268'
            '67fa003de5bf7fce4e4d3b7b3085cef490ebd7bf65042c870c2743d6ba8431cc'
            'c3cf6bf49b701943157b87c10f0098a953fbc34748206e91a480d0d413614212'
            'bce5b2a57086c4091a32b00a25a7c8a96aa66e9de12510c088ae9854313b3468'
            '2b58dfd05aaa6f6f72e0ba9239ec9baa61f8acaf5b8290e6fad326ed76e867e3'
            '76d0aa404992987a89e6f0640e4d4a39bb08cc6e9f8d961dc705c7424e3d5d40')
options=("!strip")

prepare() {
    cd "${_pkgname}-${pkgver}"
    rm -rf .* Dockerfile docker-*
    find . -type f -name ".*" | xargs rm -rf
    sed -i "s|1.2.8|${pkgver}|" demo/assets/title.md
}

package_hivision-id-photos() {
    depends=("${pkgbase}-modnet" "python-mtcnn-runtime" "python-numpy" "python-onnxruntime" "python-opencv" "python-requests" "python-starlette" "python-tqdm")
    optdepends=("${pkgbase}-resnet: offline face detection model"
                "${pkgbase}-api: api service"
                "${pkgbase}-web: webui demo service")

    install -Dm755 "${pkgbase}.sh"          "${pkgdir}/usr/bin/${pkgbase}"
    install -Dm644 "${pkgname}.sysusers"    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "${_pkgname}-${pkgver}"
    find . -type f | xargs -I {} install -Dm644 {} "${pkgdir}/usr/share/${pkgbase}/"{}
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    for md in $(ls README*.md docs/*.md); do
        ln -sf "../../${pkgbase}/${md}" "${pkgdir}/usr/share/doc/${pkgbase}/${md##*/}"
    done
}

package_hivision-id-photos-api() {
    pkgdesc+=" (api service)"
    depends=("${pkgbase}" "python-fastapi" "uvicorn")
    backup=("etc/conf.d/${pkgbase}-api.env")

    install -Dm755 "${pkgbase}-api.sh"       "${pkgdir}/usr/bin/${pkgbase}-api"
    install -Dm644 "${pkgbase}-api.service"  "${pkgdir}/usr/lib/systemd/system/${pkgbase}-api.service"
    install -Dm644 "${pkgbase}-api.env"      "${pkgdir}/etc/conf.d/${pkgbase}-api.env"
}

package_hivision-id-photos-web() {
    pkgdesc+=" (webui demo service)"
    depends=("${pkgbase}" "python-fastapi" "python-gradio")
    backup=("etc/conf.d/${pkgbase}-web.env")

    install -Dm755 "${pkgbase}-web.sh"       "${pkgdir}/usr/bin/${pkgbase}-web"
    install -Dm644 "${pkgbase}-web.service"  "${pkgdir}/usr/lib/systemd/system/${pkgbase}-web.service"
    install -Dm644 "${pkgbase}-web.env"      "${pkgdir}/etc/conf.d/${pkgbase}-web.env"
}
