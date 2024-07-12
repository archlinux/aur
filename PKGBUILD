
pkgbase=jans
pkgname=(jans-config
         jans-auth-server
         jans-scim-server
         jans-scripts
         jans-config-api
         jans-config-admin
         jans-config-users
         jans-config-fido
         jans-config-link
         jans-config-saml
         jans-config-scim
         jans-cli-tui
         jans-fido2
         jans-link
#         jans-lock
         jans-casa)
pkgver=1.1.3
pkgrel=1
pkgdesc="Janssen Project - An open source digital identity platforms that scales. Java OAuth Authorization Server and a certified OpenID Connect Provider."
arch=("any")
url="https://github.com/JanssenProject/jans"
license=("Apache")
depends=("java-runtime" "jython")
makedepends=("coreutils" "python" "python-build" "python-installer" "python-ldap")
optdepends=("opendj: Use LDAP for database"
            "jetty: Use Jetty application server"
            "redis: For caching")
source=("git+https://github.com/JanssenProject/jans.git#tag=v$pkgver"
        "jans-auth-server.xml"
        "jans-config-api.xml"
        "jans-scim.xml"
        "jans-fido2.xml"
        "jans-link.xml"
        "jans-lock.xml"
        "casa.xml"
        "jans.ini"
        "user.conf"
        "dirs.conf"
        "scopes.py"
        "scripts.py"
        "generate_config.sh")

sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "92da8426c1820c9062eb84d490cc7ebfc64c24a496fcd8e4024d277c09130b5a"
            "3fc3d4dd0fd65150216d0eae927c06cf81236f41098e621299d2aff1397ceb80"
            "33e30e50101e797b4230ccb1fbf384446639b31c7f4851384704ec48b58e9e63"
            "3e4f1c8113dd376ce7ca7584398d391165ade7126e93e60323387d097b13870e"
            "SKIP"
            "SKIP")

prepare() {
    # Auth
    find "$srcdir/jans/jans-auth-server" -iname '*.java' -print0 | xargs -0 sed -i "s|/opt/jans/jetty/jans-auth/|/var/lib/jans/|"
    find "$srcdir/jans/jans-auth-server" -iname '*.java' -print0 | xargs -0 sed -i "s|/opt/gluu/jetty/jans-auth/|/var/lib/jans/|"

    # Config API
    sed -i "s|/opt/jans/|/usr/share/jans/bin/|" "$srcdir/jans/jans-config-api/server/src/main/java/io/jans/configapi/service/status/StatusCheckerTimer.java"

    # CLI
    find "$srcdir/jans/jans-cli-tui" -type f -iname '*.py' -print0 | xargs -0 sed -i "s|from prompt_toolkit.eventloop import get_event_loop|from asyncio import get_event_loop|"
    sed -i "s|self.create_background_task(self.check_jans_cli_ini())||" "$srcdir/jans/jans-cli-tui/cli_tui/jans_cli_tui.py"
    sed -i "s|application.run()|application.run(pre_run=lambda: application.create_background_task(application.check_jans_cli_ini()))|" "$srcdir/jans/jans-cli-tui/cli_tui/jans_cli_tui.py"

    # Casa
    sed -i "s|<version>2.3</version>|<version>3.4.0</version>|" "$srcdir/jans/jans-casa/app/pom.xml"
    sed -i "s|<version>2.3</version>|<version>3.4.0</version>|" "$srcdir/jans/jans-casa/app-fips/pom.xml"
    sed -i 's|PLUGINS_DIR_NAME = "plugins"|PLUGINS_DIR_NAME = "casa-plugins"|' "$srcdir/jans/jans-casa/app/src/main/java/io/jans/casa/core/ExtensionsManager.java"
    sed -i 's|File.separator + "static"|File.separator + "custom/static"|' "$srcdir/jans/jans-casa/shared/src/main/java/io/jans/casa/service/IBrandingManager.java"
    sed -i 's|File.separator + "static/i18n"|File.separator + "custom/i18n"|' "$srcdir/jans/jans-casa/app/src/main/java/io/jans/casa/core/ZKService.java"
}

build() {
    cd "$srcdir/jans/jans-auth-server"
    mvn -Dmaven.test.skip=true package


    cd "$srcdir/jans/jans-scim"
    mvn -Dmaven.test.skip=true --projects server package


    cd "$srcdir/jans/jans-config-api"
    mvn -Dmaven.test.skip=true package

    "$srcdir/scopes.py" create "$srcdir/jans/jans-config-api/server/src/main/resources/config-api-rs-protect.json" \
                               "$srcdir/jans/jans-config-api" > "$srcdir/scopes.ldif"

    "$srcdir/scopes.py" roles "$srcdir/jans/jans-config-api/server/src/main/resources/config-api-rs-protect.json" \
                               "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-auth/role-scope-mappings.json" > "$srcdir/role-scope-mappings.json"


    "$srcdir/scopes.py" update "$srcdir/jans/jans-config-api/server/src/main/resources/config-api-rs-protect.json" \
                               "$srcdir/jans/docker-jans-config-api/templates/jans-config-api/testing-clients.ldif" > "$srcdir/testing-clients.ldif"


    cd "$srcdir/jans/jans-fido2"
    mvn -Dmaven.test.skip=true --projects server package


    cd "$srcdir/jans/jans-link"
    mvn -Dmaven.test.skip=true --projects 'server' package


    # cd "$srcdir/jans/jans-lock"
    # mvn -Dmaven.test.skip=true --projects 'server' package


    cd "$srcdir/jans/jans-casa"
    mvn -Dmaven.test.skip=true package


    cd "$srcdir/jans/jans-cli-tui"
    python -m build --wheel --no-isolation
}

package_jans-config() {
    backup=("etc/jans/conf/jans.properties"
            "etc/jans/conf/jans-couchbase.properties"
            "etc/jans/conf/jans-ldap.properties"
            "etc/jans/conf/jans-spanner.properties"
            "etc/jans/conf/jans-mysql.properties"
            "etc/jans/conf/jans-pgsql.properties"
            "etc/jans/templates/base.ldif"
            "etc/jans/templates/configuration.ldif"
            "etc/jans/jetty/start.d/jans.ini")

    mkdir -p "$pkgdir/etc/jans/conf" "$pkgdir/etc/jans/certs" \
             "$pkgdir/etc/jans/templates" "$pkgdir/etc/jans/jetty/start.d" \
             "$pkgdir/usr/share/jans/bin" "$pkgdir/var/lib/jans/custom/modules" \
             "$pkgdir/var/log/jans"

    cp "$srcdir/jans.ini" "$pkgdir/etc/jans/jetty/start.d/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/apache" "$pkgdir/etc/jans/templates/"
    cp "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans"*.properties "$pkgdir/etc/jans/conf/"
    cp "$srcdir/jans/jans-linux-setup/jans_setup/templates/"*.ldif "$pkgdir/etc/jans/templates/"
    cp "$srcdir/generate_config.sh" "$pkgdir/usr/share/jans/bin/"
    cp "$srcdir/scripts.py" "$pkgdir/usr/share/jans/bin/"

    sed -i 's|%(certFolder)s||' "$pkgdir/etc/jans/conf/jans.properties"
    sed -i 's|%(jansOptPythonFolder)s/libs|/var/lib/jans/custom/modules|' "$pkgdir/etc/jans/conf/jans.properties"

    sed -i 's|%(cache_provider_type)s|IN_MEMORY|' "$pkgdir/etc/jans/templates/configuration.ldif"

    install -D "$srcdir/user.conf" "$pkgdir/usr/lib/sysusers.d/jans.conf"
    install -D "$srcdir/dirs.conf" "$pkgdir/usr/lib/tmpfiles.d/jans.conf"

    ln -s "/var/log/jans" "$pkgdir/var/log/jans/logs"

    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
    find "$pkgdir/var/lib/jans" -type f -exec chmod 660 {} + -o -type d -exec chmod 2770 {} +
    find "$pkgdir/var/log/jans" -type f -exec chmod 660 {} + -o -type d -exec chmod 2770 {} +
}


package_jans-auth-server() {
    depends=("java-runtime" "jans-config" "jans-scripts")
    backup=("etc/jans/templates/jans-auth/jans-auth-config.json")

    mkdir -p "$pkgdir/usr/share/jans/schema-opendj" "$pkgdir/usr/share/jans/schema-openldap" \
             "$pkgdir/usr/share/jans/bin" "$pkgdir/usr/share/java/jans" \
             "$pkgdir/var/lib/jans/custom/pages" \
             "$pkgdir/var/lib/jans/custom/libs" \
             "$pkgdir/var/lib/jans/custom/static/logo" \
             "$pkgdir/var/lib/jans/custom/static/favicon" \
             "$pkgdir/var/lib/jans/custom/i18n" \
             "$pkgdir/var/lib/jans/agama/fl" \
             "$pkgdir/var/lib/jans/agama/ftl" "$pkgdir/var/lib/jans/agama/scripts" \
             "$pkgdir/etc/jans/conf" "$pkgdir/etc/jans/jetty/webapps" \
             "$pkgdir/etc/jans/templates" "$pkgdir/usr/lib/tmpfiles.d"

    cp "$srcdir/jans/jans-auth-server/client/target/jans-auth-client-jar-with-dependencies.jar" "$pkgdir/usr/share/java/jans/"
    cp "$srcdir/jans/jans-auth-server/server/target/jans-auth-server.war" "$pkgdir/usr/share/java/jans/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-auth" "$pkgdir/etc/jans/templates/"
    cp "$srcdir/role-scope-mappings.json" "$pkgdir/etc/jans/templates/jans-auth/"

    cp "$srcdir/jans/jans-linux-setup/jans_setup/static/metric/o_metric.ldif" "$pkgdir/etc/jans/templates/jans-auth/"
    cp "$srcdir/jans/agama/misc/"* "$pkgdir/var/lib/jans/agama/"

    cp "$srcdir/jans-auth-server.xml" "$pkgdir/etc/jans/jetty/webapps/"
    cp "$srcdir/jans/jans-linux-setup/jans_setup/templates/jetty/agama_web_resources.xml" "$pkgdir/etc/jans/jetty/webapps/"

    sed -i 's|%(jetty_base)s/jans-auth|/var/lib/jans|' "$pkgdir/etc/jans/jetty/webapps/agama_web_resources.xml"
    sed -i 's|%(person_custom_object_class_list)s|["jansCustomPerson","jansPerson"]|' "$pkgdir/etc/jans/templates/jans-auth/jans-auth-config.json"
    sed -i 's|/opt/jans/jetty/jans-auth/agama|/var/lib/jans/agama|' "$pkgdir/etc/jans/templates/jans-auth/jans-auth-config.json"

    cd "$srcdir/jans/jans-linux-setup/jans_setup/schema"
    PYTHONPATH=../setup_app/pylib/ python manager.py generate --type opendj --filename jans_schema.json > "$pkgdir/usr/share/jans/schema-opendj/101-jans.ldif"
    PYTHONPATH=../setup_app/pylib/ python manager.py generate --type opendj --filename custom_schema.json > "$pkgdir/usr/share/jans/schema-opendj/77-customAttributes.ldif"
    PYTHONPATH=../setup_app/pylib/ python manager.py generate --filename jans_schema.json > "$pkgdir/usr/share/jans/schema-openldap/101-jans.ldif"
    PYTHONPATH=../setup_app/pylib/ python manager.py generate --filename custom_schema.json > "$pkgdir/usr/share/jans/schema-openldap/77-customAttributes.ldif"

    echo "z /etc/jans/jetty/webapps/jans-auth-server.xml ~2750 root jans" > "$pkgdir/usr/lib/tmpfiles.d/jans-auth.conf"
    echo "Z /var/lib/jans ~2770 jans jans" >> "$pkgdir/usr/lib/tmpfiles.d/jans-auth.conf"
    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
    find "$pkgdir/var/lib/jans" -type f -exec chmod 660 {} + -o -type d -exec chmod 2770 {} +
}


package_jans-scim-server() {
    pkgdesc="Jans SCIM JSON/REST API for user management, including associated FIDO devices."

    mkdir -p "$pkgdir/etc/jans/jetty/webapps" "$pkgdir/etc/jans/templates" "$pkgdir/usr/share/java/jans" "$pkgdir/usr/lib/tmpfiles.d"

    cp "$srcdir/jans/jans-scim/server/target/jans-scim-server-"*.war "$pkgdir/usr/share/java/jans/scim-server.war"
    cp "$srcdir/jans-scim.xml" "$pkgdir/etc/jans/jetty/webapps/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-scim" "$pkgdir/etc/jans/templates/"
    cp "$srcdir/jans/docker-jans-scim/templates/jans-scim/"{clients.ldif,scopes.ldif} "$pkgdir/etc/jans/templates/jans-scim/"

    echo "z /etc/jans/jetty/webapps/jans-scim.xml ~2750 root jans" > "$pkgdir/usr/lib/tmpfiles.d/jans-scim-server.conf"
    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
}


package_jans-scripts() {
    mkdir -p "$pkgdir/usr/share/jans/examples"

    cp -R "$srcdir/jans/docs/script-catalog" "$pkgdir/usr/share/jans/"
    cp -R "$srcdir/jans/docs/agama-catalog" "$pkgdir/usr/share/jans/"
    cp "$srcdir/jans/docs/assets/sample-code-passport-js.js" "$pkgdir/usr/share/jans/examples"
}


package_jans-config-api() {
    pkgdesc="Jans Config API - RESTful control plane for all Janssen components."

    depends=("facter" "jans-config")
    backup=("etc/jans/templates/jans-config-api/clients.ldif"
            "etc/jans/templates/jans-config-api/testing-clients.ldif"
            "etc/jans/templates/jans-config-api/dynamic-conf.json")

    mkdir -p "$pkgdir/etc/jans/jetty/webapps" "$pkgdir/etc/jans/templates" \
             "$pkgdir/usr/share/java/jans" "$pkgdir/usr/share/jans/bin" \
             "$pkgdir/usr/lib/tmpfiles.d"

    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-config-api" "$pkgdir/etc/jans/templates/"
    cp "$srcdir/jans/docker-jans-config-api/templates/jans-config-api/clients.ldif" "$pkgdir/etc/jans/templates/jans-config-api/"
    cp "$srcdir/scopes.ldif" "$pkgdir/etc/jans/templates/jans-config-api/"
    cp "$srcdir/testing-clients.ldif" "$pkgdir/etc/jans/templates/jans-config-api/"
    install -Dm775 "$srcdir/jans/jans-linux-setup/jans_setup/setup_app/utils/printVersion.py" "$pkgdir/usr/share/jans/bin/"

    sed -i 's|${configOauthEnabled}|true|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"
    sed -i 's|${apiProtectionType}|oauth2|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"
    sed -i 's|${endpointInjectionEnabled}|false|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"

    sed -i 's|${issuer}|https://%(hostname)s|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"
    sed -i 's|${openIdConfigurationEndpoint}|https://%(hostname)s/.well-known/openid-configuration|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"
    sed -i 's|${introspectionEndpoint}|https://%(hostname)s/jans-auth/restv1/introspection|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"
    sed -i 's|${tokenEndpoint}|https://%(hostname)s/jans-auth/restv1/token|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"
    sed -i 's|${tokenRevocationEndpoint}|https://%(hostname)s/jans-auth/restv1/revoke|' "$pkgdir/etc/jans/templates/jans-config-api/dynamic-conf.json"

    cp "$srcdir/jans/jans-config-api/server/target/jans-config-api.war" "$pkgdir/usr/share/java/jans/"
    cp "$srcdir/jans-config-api.xml" "$pkgdir/etc/jans/jetty/webapps/"

    echo "z /etc/jans/jetty/webapps/jans-config-api.xml ~2750 root jans" > "$pkgdir/usr/lib/tmpfiles.d/jans-config-api.conf"
    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
}


package_jans-config-admin() {
    pkgdesc="Jans Config API Admin plugin"
    depends=("jans-config-api")

    mkdir -p "$pkgdir/usr/share/java/jans/config-plugins"
    cp "$srcdir/jans/jans-config-api/plugins/target/plugins/admin"*.jar "$pkgdir/usr/share/java/jans/config-plugins/"
}

package_jans-config-users() {
    pkgdesc="Jans Config API Users plugin"
    depends=("jans-config-api")

    mkdir -p "$pkgdir/usr/share/java/jans/config-plugins"
    cp "$srcdir/jans/jans-config-api/plugins/target/plugins/user"*.jar "$pkgdir/usr/share/java/jans/config-plugins/"
}

package_jans-config-fido() {
    pkgdesc="Jans Config API FIDO plugin"
    depends=("jans-config-api")

    mkdir -p "$pkgdir/usr/share/java/jans/config-plugins"
    cp "$srcdir/jans/jans-config-api/plugins/target/plugins/fido"*.jar "$pkgdir/usr/share/java/jans/config-plugins/"
}

package_jans-config-link() {
    pkgdesc="Jans Config API Link plugin"
    depends=("jans-config-api")

    mkdir -p "$pkgdir/usr/share/java/jans/config-plugins"
    cp "$srcdir/jans/jans-config-api/plugins/target/plugins/jans-link"*.jar "$pkgdir/usr/share/java/jans/config-plugins/"
}

package_jans-config-saml() {
    pkgdesc="Jans Config API SAML plugin"
    depends=("jans-config-api")

    mkdir -p "$pkgdir/etc/jans/templates" "$pkgdir/usr/share/java/jans/config-plugins"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-saml" "$pkgdir/etc/jans/templates/"

    cp "$srcdir/jans/jans-config-api/plugins/target/plugins/kc-saml"*.jar "$pkgdir/usr/share/java/jans/config-plugins/"

    sed -i 's|${jans_idp_realm}|jans-api|' "$pkgdir/etc/jans/templates/jans-saml/jans-saml-config.json"
    sed -i 's|${jans_idp_realm}|jans-api|' "$pkgdir/etc/jans/templates/jans-saml/kc_jans_api/jans.api-realm.json"
    sed -i 's|${jans_idp_user_name}|jans-api|' "$pkgdir/etc/jans/templates/jans-saml/jans-saml-config.json"
    sed -i 's|${jans_idp_user_name}|jans-api|' "$pkgdir/etc/jans/templates/jans-saml/kc_jans_api/jans.api-user.json"
    sed -i 's|${jans_idp_grant_type}|PASSWORD|' "$pkgdir/etc/jans/templates/jans-saml/jans-saml-config.json"

    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
}

package_jans-config-scim() {
    pkgdesc="Jans Config API SCIM plugin"
    depends=("jans-config-api")

    mkdir -p "$pkgdir/usr/share/java/jans/config-plugins"
    cp "$srcdir/jans/jans-config-api/plugins/target/plugins/scim"*.jar "$pkgdir/usr/share/java/jans/config-plugins/"
}


package_jans-cli-tui() {
    pkgdesc="Text UI (TUI) Command line and interactive configuration tools to help you correctly call the Config API."
    depends=("python" "python-prompt_toolkit")
    backup=("etc/jans/templates/jans-cli/client.ldif")

    mkdir -p "$pkgdir/etc/jans/templates"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-cli" "$pkgdir/etc/jans/templates/"

    cd "$srcdir/jans/jans-cli-tui"
    python -m installer --destdir="$pkgdir" dist/*.whl
    cp "$srcdir/jans/jans-config-api/docs/jans-config-api-swagger.yaml" "$pkgdir/usr/lib/python"*"/site-packages/cli_tui/cli/ops/jca/jans-config-api-swagger-auto.yaml"
    cp "$srcdir/jans/jans-config-api/plugins/docs/"*.yaml "$pkgdir/usr/lib/python"*"/site-packages/cli_tui/cli/ops/jca/"
    cp "$srcdir/jans/jans-scim/server/src/main/resources/jans-scim-openapi.yaml" "$pkgdir/usr/lib/python"*"/site-packages/cli_tui/cli/ops/scim/"
    cp "$srcdir/jans/jans-auth-server/docs/swagger.yaml" "$pkgdir/usr/lib/python"*"/site-packages/cli_tui/cli/ops/auth/"

    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
}


package_jans-fido2() {
    pkgdesc="Jans FIDO - Enables end-users to enroll and authenticate with passkeys and other FIDO authenticators."

    mkdir -p "$pkgdir/etc/jans/jetty/webapps" "$pkgdir/etc/jans/templates" \
             "$pkgdir/etc/jans/conf/fido2/mds/cert" \
             "$pkgdir/etc/jans/conf/fido2/mds/toc" \
             "$pkgdir/etc/jans/conf/fido2/server_metadata" \
             "$pkgdir/usr/share/java/jans" "$pkgdir/usr/lib/tmpfiles.d"

    cp "$srcdir/jans/jans-fido2/server/target/fido2-server.war" "$pkgdir/usr/share/java/jans/"
    cp "$srcdir/jans-fido2.xml" "$pkgdir/etc/jans/jetty/webapps/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-fido2" "$pkgdir/etc/jans/templates/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/static/fido2/authenticator_cert" "$pkgdir/etc/jans/conf/fido2/"
    wget -P "$pkgdir/etc/jans/conf/fido2/authenticator_cert" https://www.apple.com/certificateauthority/Apple_WebAuthn_Root_CA.pem

    sed -i "s|%(fido2ConfigFolder)s|/etc/jans/conf/fido2|" "$pkgdir/etc/jans/templates/jans-fido2/dynamic-conf.json"

    echo "z /etc/jans/jetty/webapps/jans-fido2.xml ~2750 root jans" > "$pkgdir/usr/lib/tmpfiles.d/jans-fido2.conf"
    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
}


package_jans-link() {
    mkdir -p "$pkgdir/etc/jans/jetty/webapps" "$pkgdir/etc/jans/templates" \
             "$pkgdir/usr/share/java/jans" "$pkgdir/usr/lib/tmpfiles.d" \
             "$pkgdir/usr/lib/tmpfiles.d" "$pkgdir/var/lib/jans/link-snapshots"

    cp "$srcdir/jans/jans-link/server/target/jans-link-server-"*.war "$pkgdir/usr/share/java/jans/jans-link-server.war"
    cp "$srcdir/jans-link.xml" "$pkgdir/etc/jans/jetty/webapps/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-link" "$pkgdir/etc/jans/templates/"

    sed -i "s|%(snapshots_dir)s|/var/lib/jans/link-snapshots|" "$pkgdir/etc/jans/templates/jans-link/jans-link-config.json"

    echo "z /etc/jans/jetty/webapps/jans-link.xml ~2750 root jans" > "$pkgdir/usr/lib/tmpfiles.d/jans-link.conf"
    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
    find "$pkgdir/var/lib/jans" -type f -exec chmod 660 {} + -o -type d -exec chmod 2770 {} +
}


# package_jans-lock() {
#    mkdir -p "$pkgdir/etc/jans/jetty/webapps" "$pkgdir/etc/jans/templates" \
#             "$pkgdir/usr/share/java/jans" "$pkgdir/usr/lib/tmpfiles.d"
#    cp "$srcdir/jans/jans-lock/server/target/jans-lock-server-"*.war "$pkgdir/usr/share/java/jans/jans-lock-server.war"
#    cp "$srcdir/jans-lock.xml" "$pkgdir/etc/jans/jetty/webapps/"
#
#    # TODO
#    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-lock" "$pkgdir/etc/jans/templates/"
#
#    echo "z /etc/jans/jetty/webapps/jans-lock.xml ~2750 root jans" > "$pkgdir/usr/lib/tmpfiles.d/jans-lock.conf"
#    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
#}


package_jans-casa() {
    depends=("jans-config")
    backup=("etc/jans/templates/jans-casa/casa-config.json"
            "etc/jans/templates/jans-casa/client.ldif")

    mkdir -p "$pkgdir/etc/jans/jetty/webapps" "$pkgdir/etc/jans/templates" \
             "$pkgdir/usr/lib/tmpfiles.d" \
             "$pkgdir/usr/share/java/jans" \
             "$pkgdir/usr/share/jans/script-catalog/client_registration" \
             "$pkgdir/usr/share/jans/script-catalog/person_authentication/casa" \
             "$pkgdir/var/lib/jans/casa-plugins" \
             "$pkgdir/var/lib/jans/custom/libs" \
             "$pkgdir/var/lib/jans/custom/static/img" \
             "$pkgdir/var/lib/jans/custom/i18n" \
             "$pkgdir/var/lib/jans/custom/pages/casa"

    ln -s img "$pkgdir/var/lib/jans/custom/static/images"

    cp "$srcdir/jans/jans-casa/app/target/casa-"*.war "$pkgdir/usr/share/java/jans/casa.war"
    cp "$srcdir/jans/jans-casa/config/target/casa-config-"*.jar "$pkgdir/var/lib/jans/custom/libs/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/templates/jans-casa" "$pkgdir/etc/jans/templates/"
    cp "$srcdir/casa.xml" "$pkgdir/etc/jans/jetty/webapps/"
    cp "$srcdir/jans/jans-linux-setup/jans_setup/templates/jetty/jans-casa_web_resources.xml" "$pkgdir/etc/jans/jetty/webapps/"

    # FIXME
    sed -i "s|/%(service_name)s|/casa|" "$pkgdir/etc/jans/jetty/webapps/jans-casa_web_resources.xml"

    sed -i 's|%(jetty_service_dir)s/static|/var/lib/jans/custom/static|' "$pkgdir/etc/jans/jetty/webapps/jans-casa_web_resources.xml"

    cp "$srcdir/jans/jans-casa/plugins/email_2fa_core/extras/"*.xhtml "$pkgdir/var/lib/jans/custom/pages/casa/"
    cp "$srcdir/jans/jans-casa/plugins/email_2fa_core/extras/"*.png "$pkgdir/var/lib/jans/custom/static/img/"

    cp "$srcdir/jans/jans-linux-setup/jans_setup/static/extension/client_registration/Casa.py" "$pkgdir/usr/share/jans/script-catalog/client_registration/"
    cp "$srcdir/jans/jans-casa/extras/"*.py "$pkgdir/usr/share/jans/script-catalog/person_authentication/casa/"
    cp "$srcdir/jans/jans-casa/plugins/email_2fa_core/extras/email_2fa_core.py" "$pkgdir/usr/share/jans/script-catalog/person_authentication/casa/"
    sed -i "s|%(casa_person_authentication_script)s|%(person_authentication_casa_casa)s|" "$pkgdir/etc/jans/templates/jans-casa/person_authentication_script.ldif"

    echo "z /etc/jans/jetty/webapps/casa.xml ~2750 root jans" > "$pkgdir/usr/lib/tmpfiles.d/jans-casa.conf"
    find "$pkgdir/etc/jans" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
    find "$pkgdir/var/lib/jans" -type f -exec chmod 660 {} + -o -type d -exec chmod 2770 {} +
    chmod -R a+rX "$pkgdir/usr"
}


package_jans-schema-manager() {
    depends=("python")

    pythonPackages=$(python -c 'import site; print(site.getsitepackages()[0])')
    mkdir -p "$pkgdir/usr/bin" "$pkgdir$pythonPackages/jans_schema_manager"
    cp "$srcdir/jans/jans-linux-setup/jans_setup/schema/"* "$pkgdir$pythonPackages/jans_schema_manager/"
    cp -R "$srcdir/jans/jans-linux-setup/jans_setup/setup_app/pylib" "$pkgdir$pythonPackages/jans_schema_manager/"
    sed -i 's|from schema import|from pylib.schema import|' "$pkgdir$pythonPackages/jans_schema_manager/schema_parser.py"
    echo -e "#!/bin/sh\nexec python $pythonPackages/jans_schema_manager/manager.py \$@" > "$pkgdir/usr/bin/jans-schema-manager"
    chmod +x "$pkgdir/usr/bin/jans-schema-manager"
}
