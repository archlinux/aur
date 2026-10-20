# lmm-extensions installation

Configure /etc/lmm.conf.d/extensions.toml before starting lmm-extensions.service.
Private credential files must be provisioned separately for the matching service user.
See filesystem-layout.md and the upstream archive README for ownership and initialization.
The package does not initialize/migrate databases, enable services, or restart services.
Arch's normal sysusers hook may provision the declared non-login service account.
Configuration upgrades use pacman's backup handling; review any .pacnew file.
Removing the package does not remove private credentials, state, or database records.
Stop the intended service explicitly before final removal.
For shared RPC, review rpc.service.conf.example and provision separate purpose tokens.
The Core works independently; extensions are optional.
