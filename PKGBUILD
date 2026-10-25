# Maintainer: staszek <staszekborkowski7@gmail.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=runyte
pkgname=runyte
pkgedition=desktop
alias=runed
appid="com.${pkgname}.${pkgname^}"
pkgver=0.4.1
pkgrel=1
pkgdesc="An editor-first, agent-ready terminal workspace for software development"

arch=('x86_64')
license=('MPL-2.0')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}" "${alias}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto' '!strip' '!debug')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e196fa3825055836823addfd5bc5a31a7003c1ad0fba339b09f8d4a874de2ba2')

prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p ${pkgname}-${pkgedition}
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release -p ${pkgname} -p ${pkgname}-${pkgedition} -- \
		--skip "plugin::state::tests::private_state_canonical_cas_delete_and_content_aba" \
		--skip "plugin::state::tests::private_state_fixed_pending_recovery_cancel_and_postpromotion_failure" \
		--skip "workspace::host::plugins::tests::applications::help::space_question_follows_the_models_registered_topic_and_live_actions" \
		--skip "workspace::host::plugins::tests::applications::state::state_post_mutation_timeout_is_unknown_and_late_success_is_not_replied_twice"
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${pkgname}-${pkgedition}" "${pkgdir}/usr/bin/${pkgname}"
	ln -sf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${alias}"

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${appid}.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=${pkgname^}
Comment=Modal Text Editor
Exec=/usr/bin/${pkgname} --window --editor %F
Icon=${appid}
Terminal=false
Categories=Development;TextEditor;
MimeType=text/plain;
StartupWMClass=${appid}
EOF

	install -Dm644 "contrib/packaging/icons/${appid}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${appid}.svg"
	for size in 16 32 64 128 256 512 1024; do
		install -Dm644 "contrib/packaging/icons/${pkgname}-${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${appid}.png"
	done

	install -Dm644 "config.example.yaml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.yaml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/user-guide.md" "${pkgdir}/usr/share/doc/${pkgname}/USER-GUIDE.md"

	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
