# Maintainer: pacmanics <pacman@altbox.de>

pkgname=pentest-ghostwriter
pkgver=7.1.1
pkgrel=1
pkgdesc='Local-first Arch Linux port of Ghostwriter for single-user offensive security workflows'
arch=('x86_64')
url='https://github.com/GhostManager/Ghostwriter'
license=('BSD-3-Clause')
depends=(
  'bash'
  'curl'
  'nodejs'
  'polkit'
  'postgresql'
  'python312'
  'valkey'
  'xdg-utils'
)
optdepends=(
  'nginx: optional reverse proxy in front of Ghostwriter'
  'hasura-cli-bin: useful for applying Hasura metadata manually during native setup'
)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/GhostManager/Ghostwriter/archive/refs/tags/v${pkgver}.tar.gz"
  'pentest-ghostwriter-bootstrap'
  'pentest-ghostwriter-init'
  'pentest-ghostwriter-web'
  'pentest-ghostwriter-queue'
  'pentest-ghostwriter-collab'
  'pentest-ghostwriter.env.example'
  'pentest-ghostwriter-web.service'
  'pentest-ghostwriter-queue.service'
  'pentest-ghostwriter-collab.service'
  'pentest-ghostwriter-graphql.service'
  'pentest-ghostwriter.nginx.conf'
  'pentest-ghostwriter.sysusers'
  'pentest-ghostwriter.tmpfiles'
  'pentest-ghostwriter-local-auth.py'
  'pentest-ghostwriter-start-root'
  'pentest-ghostwriter-stop-root'
  'ghostwriter-launcher'
  'ghostwriter-stop'
  'ghostwriter.desktop'
  'stop-ghostwriter.desktop'
  '0066_alter_reporttemplate_document.py'
  '0068_merge_pacmanics_local_document_and_upstream_0067.py'
  'README.native-port.md'
)
sha256sums=('f265b0c2200a262ff3319a1ffff3a9d02f2d38f942c95cea71dbcda297ef2814'
            '0dc916398fc88639481ec7156435b00864d2eb0d66154fe9a7a6fa63b8c452b0'
            '41e334ee463f79bab5bcff7a8aeb3239165b218f83077d6c1c962a8264f6abb6'
            'fae92ab2a78fabd39afe125f2ce348fa477a2b9900e66bd245bdf6850b38251e'
            '2f0fb5088079da1afc6aec382ab296b328874a0f1fff9e3e629a5dd12e80a7cf'
            'b2b4ec65eff41faeb0c4e07f0ae276ce91f209946d6c2b3d353e1eba69b12758'
            'bd0a29e86b5f4295ab2b12b394577f43f618d3bd9d5508455fa05efff7416872'
            '6d7f6b27722335421d0bafa06b6b78638b2a6da46218f28a3b91e345066003e6'
            '69eb52c735fea49c470ed91e0671d4bc6bdb54c7564007c54b194b0c5caac6fb'
            'c1080e00fe614365ebb811e25f0b7c261dcd353c596de06b0330f2f560f48679'
            'd145f13443bf82c3eaba3a140b98b81c8e4d2b8e99204cb88fdbcc50ac28a057'
            'acaf100910502c5fda6a57d63fafa286e8e77748ec488f5fe1b10a0d93150692'
            '4857da80c329acc3e0920fa2dddf61eab09bd1a2212a184419603c2060a4f967'
            '5f07db92a5fe4f451faff8eff86e05359f71c7e19e05b1fb3d4494a357926c47'
            '41b69ede20e71f1d72f6909e1d1790333bbc5b05f69e4d898d7698f7bd2eb29d'
            'ad1f7d4ac76c67041eca1a4245c3c87c6215aca754e1276acb3d0c0d33210a8b'
            'd759f10658cd32dbbbc1be5f0710e381d8e46ae2c3c33a7a7f0263ea892f9498'
            'a347193b184bc9be44eccc9a635a32114b7be783b4d61f6908e2007428d92640'
            'e60ef994e998c2bbd0f6af32d5da08ef0b6b193fafbb4da8910ea56085a4da6d'
            'c6becd241b2e62443ecfe772e1cb5482425a82012136daa96ce8aa3c33f08864'
            '916d9c97509aad47e0e890c6c956329bd45dbadd324075b26c9b2f11f653aa23'
            '8afc13e41cf881eab51bec419ae7f5be97e9f66d421f0832543caebfa7bedadc'
            '796e89d970858a30946ede593f3fe35e5594fc59461f80932fae1ba3e99ae77e'
            '8c7c12e253b5ce6e4d829e2151f8b210c5599632ce2380542edf62b029646eaa')

prepare() {
  cd "${srcdir}/Ghostwriter-${pkgver}"

  python - <<'PY'
from pathlib import Path

base = Path('config/settings/base.py')
text = base.read_text(encoding='utf-8')

replacements = {
    '"hosts": [("redis", 6379)],': '"hosts": [(env("REDIS_HOST", default="127.0.0.1"), env.int("REDIS_PORT", default=6379))],',
    'default={"host": "redis", "port": 6379, "db": 0}': 'default={"host": env("REDIS_HOST", default="127.0.0.1"), "port": env.int("REDIS_PORT", default=6379), "db": env.int("REDIS_DB", default=0)}',
    'REDIS_URL = env("REDIS_URL", default="redis://redis:6379")': 'REDIS_URL = env("REDIS_URL", default="redis://127.0.0.1:6379/0")',
}
for old, new in replacements.items():
    text = text.replace(old, new)

if 'whitenoise.middleware.WhiteNoiseMiddleware' not in text:
    text = text.replace(
        '    "django.middleware.security.SecurityMiddleware",\n',
        '    "django.middleware.security.SecurityMiddleware",\n    "whitenoise.middleware.WhiteNoiseMiddleware",\n',
        1,
    )

if 'config.local_auth_middleware.LocalTrustAutoLoginMiddleware' not in text:
    text = text.replace(
        '    "django.contrib.auth.middleware.AuthenticationMiddleware",\n',
        '    "django.contrib.auth.middleware.AuthenticationMiddleware",\n    "config.local_auth_middleware.LocalTrustAutoLoginMiddleware",\n',
        1,
    )

if 'ghostwriter.middleware.LocalTrustAccountBlockMiddleware' not in text:
    text = text.replace(
        '    "django_otp.middleware.OTPMiddleware",\n',
        '    "django_otp.middleware.OTPMiddleware",\n    "ghostwriter.middleware.LocalTrustAccountBlockMiddleware",\n',
        1,
    )

if 'STATICFILES_STORAGE =' not in text:
    text = text.replace(
        'STATIC_URL = "/static/"\n',
        'STATIC_URL = "/static/"\nSTATICFILES_STORAGE = "whitenoise.storage.CompressedStaticFilesStorage"\n',
        1,
    )

base.write_text(text, encoding='utf-8')

profile = Path('ghostwriter/users/templates/users/profile.html')
profile_text = profile.read_text(encoding='utf-8')

profile_replacements = {
    'href="{% url \'account_change_password\' %}"': 'href="#"',
    'href="{% url \'account_email\' %}"': 'href="#"',
    'href="{% url \'mfa_index\' %}"': 'href="#"',
}

for old, new in profile_replacements.items():
    if old not in profile_text:
        raise SystemExit(f"profile template marker not found: {old}")
    profile_text = profile_text.replace(old, new, 1)

profile.write_text(profile_text, encoding='utf-8')


production = Path('config/settings/production.py')
prod = production.read_text(encoding='utf-8')
prod = prod.replace('ADMIN_URL = env("DJANGO_ADMIN_URL")', 'ADMIN_URL = env("DJANGO_ADMIN_URL", default="admin/")')
prod = prod.replace('"MAILGUN_API_KEY": env("MAILGUN_API_KEY"),', '"MAILGUN_API_KEY": env("MAILGUN_API_KEY", default="dummy-local-mailgun-key"),')
prod = prod.replace('"MAILGUN_SENDER_DOMAIN": env("MAILGUN_DOMAIN"),', '"MAILGUN_SENDER_DOMAIN": env("MAILGUN_DOMAIN", default="ghostwriter.local"),')
prod = prod.replace("""STATICFILES_DIRS += [
    # Populated by production/django/Dockerfile
    "/frontend/"
]
""", """if (ROOT_DIR / "frontend").exists():
    STATICFILES_DIRS += [
        str(ROOT_DIR / "frontend")
    ]
""")
production.write_text(prod, encoding='utf-8')

collab = Path('javascript/src/collab_server/index.ts')
collab_text = collab.read_text(encoding='utf-8')
collab_text = collab_text.replace(
    'env["HASURA_GRAPHQL_SERVER_HOSTNAME"] || "graphql_engine"',
    'env["HASURA_GRAPHQL_SERVER_HOSTNAME"] || "127.0.0.1"',
)
collab_text = collab_text.replace(
    'port: 8000,',
    'port: Number(env["COLLAB_SERVER_PORT"] || "8001"),',
)
collab_text = collab_text.replace(
    '"http://django:8000/api/check_permissions"',
    '(env["DJANGO_API_BASE_URL"] || "http://127.0.0.1:8000") + "/api/check_permissions"',
)
collab.write_text(collab_text, encoding='utf-8')

middleware = Path('ghostwriter/middleware.py')
mw = middleware.read_text(encoding='utf-8')
if 'import os' not in mw:
    mw = mw.replace(
        'from allauth.mfa.utils import is_mfa_enabled\n',
        'from allauth.mfa.utils import is_mfa_enabled\n\nimport os\n',
        1,
    )
if 'class LocalTrustAccountBlockMiddleware' not in mw:
    mw += """


class LocalTrustAccountBlockMiddleware(MiddlewareMixin):
    blocked_url_names = {
        "account_login",
        "account_logout",
        "account_signup",
        "account_email",
        "account_change_password",
        "account_reset_password",
        "account_reset_password_from_key",
        "account_reset_password_from_key_done",
        "mfa_index",
        "mfa_activate_totp",
        "mfa_deactivate_totp",
        "mfa_view_recovery_codes",
        "mfa_download_recovery_codes",
        "mfa_list_webauthn",
        "mfa_add_webauthn",
        "mfa_edit_webauthn",
        "mfa_remove_webauthn",
        "mfa_reauthenticate",
        "mfa_reauthenticate_webauthn",
        "mfa_authenticate",
    }

    def process_view(self, request: HttpRequest, view_func, view_args, view_kwargs):
        if os.getenv("LOCAL_TRUST_MODE", "false").strip().lower() not in {"1", "true", "yes", "on"}:
            return None

        match = getattr(request, "resolver_match", None)
        url_name = getattr(match, "url_name", None)

        if url_name in self.blocked_url_names:
            return redirect("/home/")

        return None
"""
middleware.write_text(mw, encoding='utf-8')

user_detail = Path('ghostwriter/templates/users/user_detail.html')
ud = user_detail.read_text(encoding='utf-8')
ud = ud.replace(
    """  <div class="col-sm-12">
    <a class="btn btn-primary" href="{% url 'users:update' %}" role="button">My Info</a>
    <a class="btn btn-primary" href="{% url 'account_email' %}" role="button">E-Mail</a>
    <!-- Your Stuff: Custom user template urls -->
  </div>
""",
    """  <div class="col-sm-12">
    <a class="btn btn-primary" href="{% url 'users:update' %}" role="button">My Info</a>
    <a class="btn btn-primary" href="{% url 'users:userprofile_update' request.user.username %}" role="button">Avatar</a>
    <!-- Your Stuff: Custom user template urls -->
  </div>
""",
)
user_detail.write_text(ud, encoding='utf-8')
PY
}

package() {
  cd "${srcdir}/Ghostwriter-${pkgver}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -a . "${pkgdir}/opt/${pkgname}/app"

  install -Dm644 "${srcdir}/pentest-ghostwriter-local-auth.py" "${pkgdir}/opt/${pkgname}/app/config/local_auth_middleware.py"

  install -Dm755 "${srcdir}/pentest-ghostwriter-bootstrap" "${pkgdir}/usr/bin/pentest-ghostwriter-bootstrap"
  install -Dm755 "${srcdir}/pentest-ghostwriter-init" "${pkgdir}/usr/bin/pentest-ghostwriter-init"
  install -Dm755 "${srcdir}/pentest-ghostwriter-web" "${pkgdir}/usr/bin/pentest-ghostwriter-web"
  install -Dm755 "${srcdir}/pentest-ghostwriter-queue" "${pkgdir}/usr/bin/pentest-ghostwriter-queue"
  install -Dm755 "${srcdir}/pentest-ghostwriter-collab" "${pkgdir}/usr/bin/pentest-ghostwriter-collab"
  install -Dm755 "${srcdir}/pentest-ghostwriter-start-root" "${pkgdir}/usr/bin/pentest-ghostwriter-start-root"
  install -Dm755 "${srcdir}/pentest-ghostwriter-stop-root" "${pkgdir}/usr/bin/pentest-ghostwriter-stop-root"
  install -Dm755 "${srcdir}/ghostwriter-launcher" "${pkgdir}/usr/bin/ghostwriter-launcher"
  install -Dm755 "${srcdir}/ghostwriter-stop" "${pkgdir}/usr/bin/ghostwriter-stop"

  install -Dm640 "${srcdir}/pentest-ghostwriter.env.example" "${pkgdir}/etc/pentest-ghostwriter/pentest-ghostwriter.env.example"
  install -Dm644 "${srcdir}/pentest-ghostwriter-web.service" "${pkgdir}/usr/lib/systemd/system/pentest-ghostwriter-web.service"
  install -Dm644 "${srcdir}/pentest-ghostwriter-queue.service" "${pkgdir}/usr/lib/systemd/system/pentest-ghostwriter-queue.service"
  install -Dm644 "${srcdir}/pentest-ghostwriter-collab.service" "${pkgdir}/usr/lib/systemd/system/pentest-ghostwriter-collab.service"
  install -Dm644 "${srcdir}/pentest-ghostwriter-graphql.service" "${pkgdir}/usr/lib/systemd/system/pentest-ghostwriter-graphql.service"
  install -Dm644 "${srcdir}/pentest-ghostwriter.nginx.conf" "${pkgdir}/usr/share/doc/${pkgname}/pentest-ghostwriter.nginx.conf"
  install -Dm644 "${srcdir}/pentest-ghostwriter.sysusers" "${pkgdir}/usr/lib/sysusers.d/pentest-ghostwriter.conf"
  install -Dm644 "${srcdir}/pentest-ghostwriter.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pentest-ghostwriter.conf"
  install -Dm644 "${srcdir}/ghostwriter.desktop" "${pkgdir}/usr/share/applications/ghostwriter.desktop"
  install -Dm644 "${srcdir}/stop-ghostwriter.desktop" "${pkgdir}/usr/share/applications/stop-ghostwriter.desktop"
  install -Dm644 "ghostwriter/static/images/favicons/favicon.ico" "${pkgdir}/usr/share/pixmaps/ghostwriter.ico"
  rm -rf "${pkgdir}/opt/${pkgname}/app/ghostwriter/media"
  install -Dm644 "${srcdir}/0066_alter_reporttemplate_document.py" "${pkgdir}/opt/${pkgname}/app/ghostwriter/reporting/migrations/0066_alter_reporttemplate_document.py"
  install -Dm644 "${srcdir}/0068_merge_pacmanics_local_document_and_upstream_0067.py" "${pkgdir}/opt/${pkgname}/app/ghostwriter/reporting/migrations/0068_merge_pacmanics_local_document_and_upstream_0067.py"
  install -Dm644 "${srcdir}/README.native-port.md" "${pkgdir}/usr/share/doc/${pkgname}/README.native-port.md"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
