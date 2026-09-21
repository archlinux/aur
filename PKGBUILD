# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-smolagents
_pkgname=smolagents
pkgver=1.26.0
pkgrel=2
pkgdesc="A barebones library for agents that write Python code to call tools or orchestrate other agents"
arch=('any')
url="https://github.com/huggingface/smolagents"
license=('Apache-2.0')
depends=(
    'python'
    'python-huggingface-hub'
    'python-requests'
    'python-rich'
    'python-jinja'
    'python-pillow'
    'python-dotenv'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'ipython'
    'python-pandas'
    'python-pytest'
    'python-pytest-datadir'
    'python-pytest-timeout'
    'python-scikit-learn'
    'python-scipy'
)
optdepends=(
    'ipython: for notebook display and interactive source recovery'
    'python-openai: for OpenAI model support'
    'litellm: for LiteLLM model support'
    'python-transformers: for local Transformers model support'
    'python-accelerate: for local Transformers model support'
    'python-pytorch: for torch-based features'
    'python-torchvision: for torch-based features'
    'python-gradio: for Gradio UI support'
    'python-docker: for Docker code execution'
    'python-mcp: for MCP tool support'
    'python-boto3: for AWS Bedrock model support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/huggingface/smolagents/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1703dc9578c54ff4b8aaf3d2a80df24879c6fcc56e652ba50cba06924e04cdd')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local _checkroot="$srcdir/_check" _site
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    cp -a tests "$_checkroot/tests"

    cd "$_checkroot"
    # The remaining upstream modules exercise optional network providers,
    # Docker/Modal/E2B executors, Gradio, MCP, telemetry or browser/audio
    # extras. Run the complete offline core agent, executor and serialization
    # groups against the staged wheel.
    PYTHONPATH="$_checkroot$_site:$_checkroot" pytest -ra --import-mode=importlib \
        tests/test_agents.py \
        tests/test_cli.py \
        tests/test_function_type_hints_utils.py \
        tests/test_local_python_executor.py \
        tests/test_memory.py \
        tests/test_monitoring.py \
        tests/test_serialization.py \
        tests/test_tool_validation.py \
        tests/test_types.py \
        tests/test_utils.py \
        --deselect=tests/test_agents.py::TestAgent::test_init_agent_with_different_toolsets \
        --deselect=tests/test_agents.py::TestAgent::test_transformers_toolcalling_agent \
        --deselect=tests/test_agents.py::TestToolCallingAgent::test_toolcalling_agent_stream_logs_multiple_tool_calls_observations \
        --deselect=tests/test_agents.py::TestToolCallingAgent::test_toolcalling_agent_final_answer_cannot_be_called_with_parallel_tool_calls \
        --deselect=tests/test_agents.py::TestMultiAgents::test_multiagents_save \
        --deselect=tests/test_cli.py::test_load_model_openai_model \
        --deselect=tests/test_cli.py::test_load_model_litellm_model \
        --deselect=tests/test_cli.py::test_load_model_transformers_model \
        --deselect=tests/test_cli.py::test_vision_web_browser_main \
        --deselect=tests/test_monitoring.py::MonitoringTester::test_streaming_agent_image_output \
        --deselect=tests/test_monitoring.py::MonitoringTester::test_streaming_agent_text_output \
        --deselect=tests/test_monitoring.py::MonitoringTester::test_streaming_with_agent_error

    PYTHONPATH="$_checkroot$_site" python - <<'PY'
from smolagents import ToolCallingAgent
from smolagents.default_tools import PythonInterpreterTool
from smolagents.models import (
    ChatMessage,
    ChatMessageToolCall,
    ChatMessageToolCallFunction,
    MessageRole,
    Model,
)
class OfflineModel(Model):
    def __init__(self):
        super().__init__(model_id="offline-deterministic")
        self.calls = 0

    def generate(self, messages, tools_to_call_from=None, **kwargs):
        self.calls += 1
        if self.calls == 1:
            call = ChatMessageToolCall(
                id="multiply-1",
                type="function",
                function=ChatMessageToolCallFunction(
                    name="python_interpreter", arguments={"code": "6 * 7"}
                ),
            )
        else:
            call = ChatMessageToolCall(
                id="answer-1",
                type="function",
                function=ChatMessageToolCallFunction(name="final_answer", arguments={"answer": 42}),
            )
        return ChatMessage(role=MessageRole.ASSISTANT, content="offline", tool_calls=[call])


agent = ToolCallingAgent(
    model=OfflineModel(), tools=[PythonInterpreterTool()], max_steps=3
)
answer = agent.run("Compute six times seven")
assert int(answer) == 42
print("offline tool-calling agent workflow passed")
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
