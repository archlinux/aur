# Run the following command in the directory where this file lives to build a
# new docker image:

# - docker pull finalduty/archlinux && docker-compose --file base.yml build --no-cache

# Run the following command in the directory where this file lives to start:

# - docker-compose --file base.yml up

           # region configuration
FROM       finalduty/archlinux
MAINTAINER Torben Sickert <info@torben.website>
LABEL      Description="proxy" Vendor="thaibault products" Version="1.0"
EXPOSE     80 443
ENV        APPLICATION_PATH /srv/http
ENV        APPLICATION_SPECIFIC_NGINX_CONFIGURATION_FILE_PATH '../../etc/nginx/conf.d/*.conf'
ENV        APPLICATION_USER_ID_INDICATOR_FILE_PATH '/etc/nginx/conf.d'
ENV        COMMAND 'nginx'
ENV        DEFAULT_MAIN_USER_GROUP_ID 100
ENV        DEFAULT_MAIN_USER_ID 1000
ENV        INITIALIZING_FILE_PATH '/usr/bin/initialize'
ENV        MAIN_USER_GROUP_NAME users
ENV        MAIN_USER_NAME http
ENV        TEMPORARY_NGINX_PATH '/tmp/nginx/'
WORKDIR    $APPLICATION_PATH
USER       root
           # endregion
           # region retrieve wget
RUN        sed 's/^#//g' --in-place /etc/pacman.d/mirrorlist && \
           pacman --needed --noconfirm --noprogressbar --sync wget && \
           # endregion
           # region get fastest server update list for germany
           url='https://www.archlinux.org/mirrorlist/?country=DE&protocol=http&ip_version=4&use_mirror_status=on' && \
           temporaryFilePath="$(mktemp --suffix=-mirrorlist)" && \
           echo Donwloading latest mirror list. && \
           wget --output-document - "$url" | sed 's/^#Server/Server/g' \
               >"$temporaryFilePath" && \
           echo Backing up the original mirrorlist file. && \
           mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.orig && \
           echo Rotating the new list into place. && \
           mv "$temporaryFilePath" /etc/pacman.d/mirrorlist && \
           # endregion
           # region adding arch user repository and download database file
           if ! grep '^\[archlinuxfr\]' /etc/pacman.conf &>/dev/null; then echo -n -e '\n[archlinuxfr]\nSigLevel = Optional TrustAll\nServer = http://repo.archlinux.fr/$arch' >>/etc/pacman.conf; fi; \
           pacman --needed --noconfirm --noprogressbar --refresh --sync \
               --sysupgrade && \
           # endregion
           # region install and configure yaourt
           pacman --needed --noconfirm --noprogressbar --sync base-devel \
               yaourt && \
           # NOTE: We have to patch "makepkg" to use it as root.
           sed --in-place \
               's/if (( EUID == 0 )); then/if (( EUID == 0 )) \&\& false; then/' \
               /usr/bin/makepkg && \
           # endregion
           # region install needed packages
           # NOTE: "neovim" is only needed for debugging scenarios.
           yaourt --needed --noconfirm --sync nginx neovim openssl && \
           # endregion
           # region tidy up
           rm /var/cache/* --recursive --force
           # endregion
           # region preconfigure application user
           # Set proper default user and group id to avoid expendsive user id
           # mapping on application startup.
RUN        [[ "$MAIN_USER_NAME" != 'root' ]] && \
           groupmod --gid "$DEFAULT_MAIN_USER_GROUP_ID" \
               "$MAIN_USER_GROUP_NAME" && \
           usermod --gid "$DEFAULT_MAIN_USER_GROUP_ID" --uid \
               "$DEFAULT_MAIN_USER_ID" "$MAIN_USER_NAME" && \
           chown --recursive "${MAIN_USER_NAME}:${MAIN_USER_GROUP_NAME}" \
               "$(pwd)" && \
           echo /usr/bin/bash>>/etc/shells && \
           chsh --shell /usr/bin/bash "$MAIN_USER_NAME" && \
           usermod --home "$(pwd)" "$MAIN_USER_NAME" || \
           true
           # endregion
           # region preconfigure application location
RUN        mkdir --parents "$APPLICATION_USER_ID_INDICATOR_FILE_PATH" && \
           chown "$MAIN_USER_NAME:$MAIN_USER_GROUP_NAME" --recursive \
               "$APPLICATION_USER_ID_INDICATOR_FILE_PATH"
           # endregion
           # region preconfigure nginx to integrate application specifc options
           # Set all file path options to application user writable locations
           # that will otherwise default to restricted locations accessible
           # only to root.
RUN        echo -e "daemon    off;\nerror_log ${TEMPORARY_NGINX_PATH}errorLog;\npid       ${TEMPORARY_NGINX_PATH}pid;\n#user      ${MAIN_USER_NAME} ${MAIN_USER_GROUP_NAME};\nworker_processes  4;\nevents {\n    worker_connections  1024;\n}\nhttp {\n    access_log              ${TEMPORARY_NGINX_PATH}accessLog;\n    client_body_temp_path   ${TEMPORARY_NGINX_PATH}clientBody;\n    fastcgi_temp_path       ${TEMPORARY_NGINX_PATH}fastcgiTemp;\n    proxy_temp_path         ${TEMPORARY_NGINX_PATH}proxyTemp;\n    scgi_temp_path          ${TEMPORARY_NGINX_PATH}scgiTemp;\n    uwsgi_temp_path         ${TEMPORARY_NGINX_PATH}uwsgiTemp;\n    include                 mime.types;\n    default_type            application/octet-stream;\n    sendfile                on;\n    gzip                    on;\n    client_body_buffer_size 256k;\n    proxy_set_header        X-Forwarded-Proto \$scheme;\n    proxy_set_header        Upgrade \$http_upgrade;\n    proxy_set_header        Connection \"upgrade\";\n    keepalive_timeout       65;\n    resolver                8.8.8.8;\n    include                 $(pwd)/$APPLICATION_SPECIFIC_NGINX_CONFIGURATION_FILE_PATH;\n}" \
               1>/etc/nginx/nginx.conf && \
           mkdir --parents /etc/nginx/html && \
           echo ''>/etc/nginx/html/index.html && \
           mkdir --parents "$TEMPORARY_NGINX_PATH" && \
           chown --recursive "${MAIN_USER_NAME}:${MAIN_USER_GROUP_NAME}" \
               "$TEMPORARY_NGINX_PATH" && \
           # NOTE: Allow none root user to bind to ports lower than 1024 with
           # nginx.
           setcap cap_net_bind_service=ep /usr/bin/nginx
           # endregion
           # region set proper user ids and bootstrap application
RUN        echo -e "#!/usr/bin/bash\n\nset -e\nOLD_GROUP_ID=\$(id --group \"\$MAIN_USER_NAME\")\nOLD_USER_ID=\$(id --user \"\$MAIN_USER_NAME\")\nGROUP_ID_CHANGED=false\nif [[ \"\$HOST_GID\" == '' ]]; then\n    HOST_GID=\"\$(stat --format '%g' \"\$APPLICATION_USER_ID_INDICATOR_FILE_PATH\")\"\nfi\nif [[ \$OLD_GROUP_ID != \$HOST_GID ]]; then\n    echo \"Map group id \$OLD_GROUP_ID from application user \$MAIN_USER_NAME to host group id \$HOST_GID from \$(stat --format '%G' \"\$APPLICATION_USER_ID_INDICATOR_FILE_PATH\").\"\n    usermod --gid \"\$HOST_GID\" \"\$MAIN_USER_NAME\"\n    GROUP_ID_CHANGED=true\nfi\nif [[ \"\$HOST_UID\" == '' ]]; then\n    HOST_UID=\"\$(stat --format '%u' \"\$APPLICATION_USER_ID_INDICATOR_FILE_PATH\")\"\nfi\nUSER_ID_CHANGED=false\nif [[ \$OLD_USER_ID != \$HOST_UID ]]; then\n    echo \"Map user id \$OLD_USER_ID from application user \$MAIN_USER_NAME to host user id \$HOST_UID from \$(stat --format '%U' \"\$APPLICATION_USER_ID_INDICATOR_FILE_PATH\").\"\n    usermod --uid \"\$HOST_UID\" \"\$MAIN_USER_NAME\"\n    USER_ID_CHANGED=true\nfi\nif \$GROUP_ID_CHANGED; then\n    find ./ -xdev -group \$OLD_GROUP_ID -exec chgrp --no-dereference \$MAIN_USER_GROUP_NAME {} \\;\nfi\nif \$USER_ID_CHANGED; then\n    find ./ -xdev -user \$OLD_USER_ID -exec chown --no-dereference \$MAIN_USER_NAME {} \\;\nfi\nchmod +x /dev/\nchown \$MAIN_USER_NAME:\$MAIN_USER_GROUP_NAME /proc/self/fd/0 /proc/self/fd/1 /proc/self/fd/2\nset +x\nexec su \$MAIN_USER_NAME --group \$MAIN_USER_GROUP_NAME -c \"\$COMMAND\"" \
               >"$INITIALIZING_FILE_PATH" && \
           chmod +x "$INITIALIZING_FILE_PATH"
CMD        ["/usr/bin/initialize"]
           # endregion
# region modline
# vim: set tabstop=4 shiftwidth=4 expandtab filetype=dockerfile:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
