# Changelog

## 0.2.0 — 2026-06-02

### Added
- Admin panel: Allowlist-Verwaltung (add/remove/toggle-admin), User-Suche
- AuthService: `is_admin`-Claim im JWT, Admin-API-Routen
- Auto-Admin: Erster registrierter User wird automatisch Admin
- ChampSelect Timeout (Blind Pick 60s, Draft 30s/Action)
- Linux `latest-linux.yml` für electron-updater
- AUR-Paket (PKGBUILD) für Arch Linux

### Changed
- OAuth-Login speichert Nextcloud-ID + Displayname in Allowlist
- Token-Refresh aktualisiert jetzt admin/name/tag aus JWT
- Allowlist-Check verwendet `provider_sub` statt `user_id`

### Fixed
- `PATCH /admin/allowlist/:id/toggle-admin` gab falsche `is_admin` zurück
- Admin-Status verschwand nach Token-Refresh

## 0.1.0 — 2026-05-26

### Added
- Electron Launcher mit OAuth (Nextcloud), Lobby-Liste, ChampSelect
- Auto-Client-Download (Godot) + Install-Management
- Launcher Self-Update per electron-updater (generic provider)
- Friends-Liste, Ranking, Collection, Settings
- i18n (DE/EN)
- Hero-Section, Featured Cards, Splash-Rotation
- `log://` Protocol-Handler für Auth-Callback
- Game-Launch: Spawnt Godot-Binary mit `--name --server --champion` Args
